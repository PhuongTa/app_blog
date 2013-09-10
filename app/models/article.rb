class Article < ActiveRecord::Base
  attr_accessible :author_name, :content, :name, :user_id
  belongs_to :user

  #scope :visiblie, where("hidden != ?", true)
  scope :published, lambda{where("published_at <= ? ",Time.zone.now) }
  #scope :recent, visiblie.published.order("published_at desc")
  scope :recent, published.order("published_at desc")
  def self.published?
  	self.published == true
  end

end
