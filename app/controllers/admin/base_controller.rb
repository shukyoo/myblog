class Admin::BaseController < ApplicationController
  layout 'admin/application'
  before_action :authenticate_admin_user!
end
