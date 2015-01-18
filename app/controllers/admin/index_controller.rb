class Admin::IndexController < Admin::BaseController
  def index
    render "admin/index", :layout => false
  end
end
