class Page < ActiveRecord::Base
  acts_as_nested_set
#  after_create :caching_level, :caching_url
  after_save :rebuild_tree
  #before_create :caching_url_and_level
  after_create :caching_url_and_level_first
  before_save :caching_url_and_level
  
  has_many :items
  has_many :blocks, :as => :attachable
#  has_many :assets, :as => :assetable
#  has_many :asset_groups, :through => :assets
  has_one :item_assign
  
  
#  mount_uploader :image, DefaultUploader
#  mount_uploader :pdf, DefaultUploader
  has_one :image, :as => :assetable, :class_name => "Page::Image", :dependent => :destroy
  has_one :pdf, :as => :assetable, :class_name => "Page::Pdf", :dependent => :destroy
  has_many :attachments, :as => :assetable, :class_name => "Page::Attachment", :dependent => :destroy
  has_many :rules, :as => :assetable, :class_name => "Page::Rule", :dependent => :destroy
  has_many :blanks, :as => :assetable, :class_name => "Page::Blank", :dependent => :destroy
  
  accepts_nested_attributes_for :blocks, :image, :rules, :blanks, :attachments, :pdf, :allow_destroy => true, :reject_if => :all_blank
  
 # sortable :scope => :parent_id

  scope :menu, lambda{where("menu > 0 ")}
  def admin_path
    ids = ["0"]
    self_and_ancestors.each do |a|
      ids << a.id
    end
    
    ids.join("/")
  end
  
  def url
    path = []
    self_and_ancestors.each do |a|
      path << a.slug
    end
    "/"+path.join("/")+"/"
  end
  

  def caching_url_and_level
    self.cached_url = url
    self.cached_level = level
#    self.save! if new_record?
  end
  
  def caching_url_and_level_first
    self.cached_url = url
    self.cached_level = level
    self.save
  end
  
  private
    
    def rebuild_tree
      Page.rebuild!
    end
    
    def caching_level
      self.cached_level = level
    end
    
    
  
=begin
  def to_xml
    self.to_xml do |xml|
      xml.level self.level
    end
  end
=end
end
