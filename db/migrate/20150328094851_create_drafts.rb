class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
      t.references :article, index: true
      t.references :category, index: true
      t.string :title
      t.text :content
      t.integer :summary_length

      t.timestamps null: false
    end
    add_foreign_key :drafts, :articles
    add_foreign_key :drafts, :categories
  end
end
