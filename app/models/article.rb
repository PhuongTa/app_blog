class Article < ActiveRecord::Base
  attr_accessible :author_name, :content, :name, :user_id
  belongs_to :user
end
