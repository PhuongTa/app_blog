class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :trackable, 
  devise :database_authenticatable, :registerable,:token_authenticatable,
  		 :confirmable,:recoverable, 
         :rememberable,:validatable
  
  attr_accessor :current_password
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, 
  :remember_me,:current_password,:role_ids,:first_name,:last_name

  # attr_accessible :title, :body

  has_many :articles
  has_many :comments, :dependent => :destroy
  has_and_belongs_to_many :roles

  def role?(role)
    #return self.roles.find_by_name(role).try(:name) == role.to_s.camelcase
    return !!self.roles.find_by_name(role.to_s.camelcase)
    #return !!roles.include?(role.to_s.underscore)
  end

  def high_level
    hl= self.roles.min.try(:level)
    self.roles.find_by_level(hl)
  end

  def full_name 
   [first_name,last_name].compact.join(' ').to_s
  end
end
