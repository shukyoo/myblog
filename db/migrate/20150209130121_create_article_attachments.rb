class CreateArticleAttachments < ActiveRecord::Migration
  def change
    create_table :article_attachments do |t|
      t.references :article, index: true
      t.references :attachment, index: true

      t.timestamps null: false
    end
    add_foreign_key :article_attachments, :articles
    add_foreign_key :article_attachments, :attachments
  end
end
