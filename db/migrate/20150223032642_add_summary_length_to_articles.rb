class AddSummaryLengthToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :summary_length, :integer
  end
end
