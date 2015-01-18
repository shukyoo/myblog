class Admin::AuthController < Admin::BaseController
  def login
    render "admin/auth/login", :layout => false
  end
end
