class AddPublishedPublishedAtToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :published, :boolean, :default => false
    add_column :articles, :published_at, :datetime
  end

end
