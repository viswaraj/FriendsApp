class HomeController < ApplicationController

  def index
    if current_user.nil?
      redirect_to login_path
    else
     @requests = User.find(:all, :joins=>"INNER JOIN  friends_lists ON users.id = friends_lists.friend_id", :conditions => ["friends_lists.user_id = ? and friends_lists.accepted = 'requested'",current_user.id])
    end
  end

  def edit_profile
    @user=current_user
    @sexes = User::GENDER
    @countries = Country.list_for_select
    @status=User::RSTATUS
  end

  def update_profile
     @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to home_path
    else
      render :action => 'edit_profile'
    end
  end

  def profile
    @user=User.find(params[:id])
  end

  def view_members
    @users=User.find(:all,:conditions=>["id != ?",current_user.id])
    @friends = User.find(:all, :joins=>"INNER JOIN  friends_lists ON users.id = friends_lists.friend_id", :conditions => ["friends_lists.user_id = ? and friends_lists.accepted = 'confirm'",current_user.id])
    @requests = User.find(:all, :joins=>"INNER JOIN  friends_lists ON users.id = friends_lists.friend_id", :conditions => ["friends_lists.user_id = ? and friends_lists.accepted = 'requested'",current_user.id])
  end


def view_friends
    @friends = User.find(:all, :joins=>"INNER JOIN  friends_lists ON users.id = friends_lists.friend_id", :conditions => ["friends_lists.user_id = ? and friends_lists.accepted = 'confirm'",current_user.id])
  end
def remove_friends
      if friends_already?(current_user.id, params[:id])
      remove_friend(current_user.id, params[:id])
    end
    redirect_to home_path

end



  def confirm_friends
    FriendsList.find(:first,:conditions=>["user_id =? and friend_id = ?",current_user.id,params[:id]]).update_attribute(:accepted,"confirm")
    FriendsList.find(:first,:conditions=>["user_id =? and friend_id = ?",params[:id],current_user.id]).update_attribute(:accepted,"confirm")
    redirect_to home_path
  end
  
  def add_friends
    if !friends_already?(current_user.id, params[:id])
      add_friend(current_user.id, params[:id])
    end
    redirect_to :action=>"view_members"
  end

  def destroy_friends
    if friends_already?(current_user.id, params[:id])
      remove_friend(current_user.id, params[:id])
    end
    redirect_to home_path
  end

  def friends_already?(user_id, friend_id)
    user = User.find(user_id)
    friend = User.find(friend_id)
    return true if user.friends.include?(friend) && friend.friends.include?(user)
    false
  end

protected

  def add_friend(user_id, friend_id)
    FriendsList.create({:user_id => user_id, :friend_id => friend_id,:accepted=>"request"})
    FriendsList.create({:user_id => friend_id, :friend_id => user_id,:accepted=>"requested"})
  end

  def remove_friend(user_id, friend_id)
    FriendsList.delete_all "user_id = #{user_id} and friend_id = #{friend_id}"
    FriendsList.delete_all "user_id = #{friend_id} and friend_id = #{user_id}"
  end

end
