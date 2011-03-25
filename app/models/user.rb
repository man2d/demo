class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :user_type
  validates_presence_of :user_type
  
  has_many :blog_posts
  has_many :items
  has_many :resumes
  
  def captain?
    self.user_type == "captain"
  end
  
  def owner?
    self.user_type == "owner"
  end
end
