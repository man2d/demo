class Asset < ActiveRecord::Base
#  include CarrierWave::Compatibility::Paperclip
  
  mount_uploader :asset, AssetUploader, :mount_on => :filename
  mount_uploader :file, AssetUploader, :mount_on => :filename
#  mount_
#  has_attached_file :asset
  belongs_to :asset_group
  belongs_to :imageable, :polymorphic => true
end
