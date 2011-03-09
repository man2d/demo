class Asset < ActiveRecord::Base
  mount_uploader :filename, AssetUploader
#  has_attached_file :asset
  belongs_to :asset_group
  belongs_to :imageable, :polymorphic => true
end
