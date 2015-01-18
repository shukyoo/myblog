class Admin::AuthController < Admin::BaseController
  skip_before_action :authenticate_admin_user!
  def login
    render "admin/auth/login", :layout => false
  end
end
