class Comment < ActiveRecord::Base
  attr_accessible :article_id, :author_name, :content, 
  :site_url, :user_id,:article

  belongs_to :user
  belongs_to :article , :counter_cache => true

  validates :author_name, :presence => true
  validates :content, :presence => true
end
