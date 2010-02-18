class HomeController < ApplicationController
  def index
    
  end

  def edit_profile
@user=current_user
	@sexes = User::SEXES
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
    @user=current_user
  end
  def view_members
    @users=User.find(:all,:conditions=>["id != ?",current_user.id])
  end


  def confirm_friends
    @friend = User.find_by_id(params[:id])
    @current_user = current_user
  end
  def add_friends
    if !friends_already?(current_user.id, params[:id])
      add_friend(current_user.id, params[:id])
    end
    redirect_to home_path
  end

  def destroy_friends
    if friends_already?(params[:user_id], params[:id])
      remove_friend(params[:user_id], params[:id])
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
  FriendsList.create({:user_id => user_id, :friend_id => friend_id})
  FriendsList.create({:user_id => friend_id, :friend_id => user_id})
end

def remove_friend(user_id, friend_id)
  FriendsList.delete_all "user_id = #{user_id} and friend_id = #{friend_id}"
  FriendsList.delete_all "user_id = #{friend_id} and friend_id = #{user_id}"
end

end
