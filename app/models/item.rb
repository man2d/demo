class Item < ActiveRecord::Base
  default_scope :conditions => {:show_in_catalog => true}
  #has_many :assets, :as => :assetable
=begin
  with_options :as => :assetable, :class_name => "Asset" do |item|
    item.has_many :exterior_assets, :conditions => {:asset_group_id => 1}  
    item.has_many :interior_assets, :conditions => {:asset_group_id => 2}  
    item.has_many :threed_assets, :conditions => {:asset_group_id => 3} 
    item.has_many :specification_assets, :conditions => {:asset_group_id => 4}
  end
=end
=begin
  def self.find_with_hidden(*args)
    self.with_exclusive_scope { find(*args) }
  end

  def self.find_all_with_hidden(*args)
    self.with_exclusive_scope { find(:all) }
  end
  
  def self.find_all_brand_new
    self.with_exclusive_scope(:find => limit(10))
  end
=end
  scope :used, :conditions => "page_id = 10 OR page_id IS NULL"
  scope :brand_new, :conditions => "page_id != 10"
  
  def url
      page.url + self.id.to_s if page
  end
  alias_method :item_url, :url

  belongs_to :item_assign
  belongs_to :page
  belongs_to :user
  
  has_many :item_properties
  has_many :properties, :through => :item_properties    
  has_many :exterior_images, :as => :assetable, :class_name => "Item::ExteriorImage", :dependent => :destroy
  has_many :interior_images, :as => :assetable, :class_name => "Item::InteriorImage", :dependent => :destroy
  has_many :gallery_images, :as => :assetable, :class_name => "Item::GalleryImage", :dependent => :destroy
  has_many :wallpapers, :as => :assetable, :class_name => "Item::Wallpaper", :dependent => :destroy
  has_many :specification_images, :as => :assetable, :class_name => "Item::SpecificationImage", :dependent => :destroy
  has_many :threed_assets, :as => :assetable, :class_name => "Item::ThreedAsset", :dependent => :destroy
  has_one :video, :as => :assetable, :class_name => "Item::Video", :dependent => :destroy
  has_one :image, :as => :assetable, :class_name => "Item::Image", :dependent => :destroy
  has_one :slide  
  
  accepts_nested_attributes_for :exterior_images, :interior_images, :wallpapers, :gallery_images, :specification_images, :video, :image, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :item_properties, :allow_destroy => true, :reject_if => proc { |attributes| attributes['value'].blank? }
#  accepts_nested_attributes_for :image,  :allow_destroy => true

  

  

#  sortable :scope => :page_id
  
#  accepts_nested_attributes_for :assets, :allow_destroy => true

#  mount_uploader :image, ImageUploader

end
