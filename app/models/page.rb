class Page < ActiveRecord::Base
  acts_as_nested_set
  before_save :caching_level, :caching_url
  before_create :caching_level, :caching_url
  after_save :rebuild_tree

  has_many :items
  has_many :blocks, :as => :attachable
  has_many :assets, :as => :assetable
  has_many :asset_groups, :through => :assets
  has_one :item_assign
  accepts_nested_attributes_for :blocks, :assets
  
  mount_uploader :image, DefaultUploader
  
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
  

  def caching_url
    self.cached_url = url
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
