class Item < ActiveRecord::Base

  #has_many :assets, :as => :assetable
=begin
  with_options :as => :assetable, :class_name => "Asset" do |item|
    item.has_many :exterior_assets, :conditions => {:asset_group_id => 1}  
    item.has_many :interior_assets, :conditions => {:asset_group_id => 2}  
    item.has_many :threed_assets, :conditions => {:asset_group_id => 3} 
    item.has_many :specification_assets, :conditions => {:asset_group_id => 4}
  end
=end
  def url
      page.url + self.id.to_s if page
  end
  alias_method :item_url, :url

  belongs_to :item_assign
  belongs_to :page

  has_many :item_properties
  has_many :properties, :through => :item_properties    
  has_many :exterior_images, :as => :assetable, :class_name => "Item::ExteriorImage", :dependent => :destroy
  has_many :interior_images, :as => :assetable, :class_name => "Item::InteriorImage", :dependent => :destroy
  has_many :gallery_images, :as => :assetable, :class_name => "Item::GalleryImage", :dependent => :destroy
  has_many :wallpapers, :as => :assetable, :class_name => "Item::Wallpaper", :dependent => :destroy
  has_many :specification_images, :as => :assetable, :class_name => "Item::SpecificationImage", :dependent => :destroy
  has_many :threed_assets, :as => :assetable, :class_name => "Item::ThreedAsset", :dependent => :destroy
  has_many :videos, :as => :assetable, :class_name => "Item::Video", :dependent => :destroy
  has_one :image, :as => :assetable, :class_name => "Item::Image", :dependent => :destroy
  
  
  accepts_nested_attributes_for :exterior_images, :interior_images, :wallpapers, :gallery_images, :specification_images, :videos, :image, :allow_destroy => true
#  accepts_nested_attributes_for :image,  :allow_destroy => true

  

  
  scope :used, :conditions => {:page_id => 10}
  scope :brand_new, :conditions => "page_id != 10"
#  sortable :scope => :page_id
  
#  accepts_nested_attributes_for :assets, :allow_destroy => true
  accepts_nested_attributes_for :item_properties, :allow_destroy => true
#  mount_uploader :image, ImageUploader
  has_one :slide
end
