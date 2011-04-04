#coding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :user_type, :about, :city, :phone, :receive_comments, :activated, :avatar, :item, :avatar_attributes
  validates_presence_of :user_type
  has_many :attachments, :as => :assetable, :class_name => "User::Attachment", :dependent => :destroy
  has_one :avatar, :as => :assetable, :class_name => "User::Avatar", :dependent => :destroy
  has_one :resume  

  
  has_many :blog_posts
#  has_many :items
  has_many :resumes
  has_one :item
  
  accepts_nested_attributes_for :avatar, :item
  
  def after_sign_in_path_for(resource)
    
    if resource.is_a?(User) && !resource.activated?
      sign_out resource
      banned_user_path
    else
     super
    end
  end
  
  def captain?
    self.user_type == "captain"
  end
  
  def owner?
    self.user_type == "owner"
  end
  
  def admin?
    self.user_type == 'admin'
  end
  
  def password_required?
    new_record?
   end
  
end
