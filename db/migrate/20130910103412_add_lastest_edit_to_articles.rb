class AddLastestEditToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :lastest_edit, :datetime
  end
end
