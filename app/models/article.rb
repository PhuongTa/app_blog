class Article < ActiveRecord::Base
  attr_accessible :author_name, :content, :name, :user_id
  belongs_to :user
  has_many :comments,:dependent => :destroy
  
  validates :name, :presence => true
  validates :content, :presence => true
  validates :author_name,:presence => true



  #scope :visiblie, where("hidden != ?", true)
  scope :published, where("published != ?", false )
  scope :published_at, lambda{where("published_at <= ? ",Time.zone.now) }
  #scope :recent, visiblie.published.order("published_at desc")
  #scope :recent, published.published_at.order("published_at desc")
  scope :recent,published_at.order("published_at desc")
  def self.published?
  	self.published == true
  end

end
