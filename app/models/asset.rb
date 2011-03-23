class Asset < ActiveRecord::Base
#  include CarrierWave::Compatibility::Paperclip
#  before_create :mount_uploaders
  
#  mount_uploader :asset, AssetUploader, :mount_on => :filename  
  

  #def mount_uploaders
  #  if ["jpg","gif","png","jpeg"].include?(filename.split(".").last)
  #    mount_uploader :asset, ImageUploader, :mount_on => :filename
  #  else
  #   mount_uploader :asset, AssetUploader, :mount_on => :filename
  #  end  
  #end
#  mount_uploader :file, AssetUploader, :mount_on => :filename
#  mount_
#  has_attached_file :asset
 # belongs_to :asset_group
  belongs_to :assetable, :polymorphic => true
  delegate :url, :to => :attachment 
end
=begin
class Item::Video < Asset
  has_attached_file :attachment
end

class Item::ExteriorImage < Asset
  has_attached_file :attachment
end

class Item::InteriorImage < Asset
  has_attached_file :attachment
end

class Page::Image < Asset
  has_attached_file :attachment
end

class Page::Document < Asset
  has_attached_file :attachment
end
=end