class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :timeoutable, :lockable, :timeout_in => 8.hours
  validates_format_of :email,:with => Devise.email_regexp
  # validates :email, :presence => true, :email => true
end
