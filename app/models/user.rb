class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :trackable, 
  devise :database_authenticatable, :registerable,:token_authenticatable,
  		 :confirmable,:recoverable, 
         :rememberable,:validatable
  attr_accessible :role_ids
  attr_accessor :current_password
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:current_password
  # attr_accessible :title, :body

  has_many :articles
  has_and_belongs_to_many :roles


  def role?(role)
    return self.roles.find_by_name(role).try(:name) == role.to_s
    #return !!self.roles.find_by_name(role.to_s.undescore)
  end
end
