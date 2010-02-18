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
end
