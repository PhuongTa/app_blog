class AddIndexPublishedToArticles < ActiveRecord::Migration
  def change
  	  add_index :articles, [:published,:published_at]
  end
end
