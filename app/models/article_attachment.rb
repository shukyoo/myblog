class ArticleAttachment < ActiveRecord::Base
  belongs_to :article
  belongs_to :attachment
end
