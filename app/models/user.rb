#coding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :user_type
  validates_presence_of :user_type, :message => "^Выберите тип акккаунта"
  has_many :attachments, :as => :assetable, :class_name => "User::Attachments", :dependent => :destroy
  
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
