class Admin::UsersController < Admin::BaseController
  before_filter :authenticate_admin_user!
  
  def edit_password
  end

  def update_password
    @user = AdminUser.find(current_admin_user.id)
    if @user.update(params.permit(:password))
      # Sign in the user by passing validation in case their password changed
      # sign_in @user, :bypass => true
      redirect_to admin_root_path
    else
      render "edit"
    end
  end
end
