class Article < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: true
  validates :content, presence: true

  scope :resent, -> {order(created_at: :desc)}
end
