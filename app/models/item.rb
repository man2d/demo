class Item < ActiveRecord::Base
  has_many :item_properties
  has_many :properties, :through => :item_properties
  has_many :assets, :as => :assetable
  with_options :as => :assetable, :class_name => "Asset" do |item|
    item.has_many :exterior_assets, :conditions => {:asset_group_id => 1}  
    item.has_many :interior_assets, :conditions => {:asset_group_id => 2}  
    item.has_many :threed_assets, :conditions => {:asset_group_id => 3} 
    item.has_many :specification_assets, :conditions => {:asset_group_id => 4}
  end
  
  belongs_to :item_assign
  belongs_to :page
  
  def url
    page.url + self.id.to_s
  end
  
  scope :used, :conditions => {:page_id => 10}
  scope :brand_new, :conditions => "page_id != 10"
#  sortable :scope => :page_id
  
  accepts_nested_attributes_for :assets, :allow_destroy => true
  accepts_nested_attributes_for :item_properties, :allow_destroy => true
  mount_uploader :image, ImageUploader
  has_one :slide
end
