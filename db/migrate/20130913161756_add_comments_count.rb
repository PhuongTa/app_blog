class AddCommentsCount < ActiveRecord::Migration
  def change
  	add_column :articles, :comments_count, :integer, :default => 0

  	Article.reset_column_information
  	Article.all.each do |a|
  		Article.update_counters a.id, :comments_count => a.comments.length
  	end
  end
end
