class Item < ActiveRecord::Base
  has_many :item_properties
  has_many :properties, :through => :item_properties
  has_many :assets, :as => :assetable
  
  accepts_nested_attributes_for :assets, :allow_destroy => true
  accepts_nested_attributes_for :item_properties, :allow_destroy => true
  mount_uploader :image, ImageUploader
end
