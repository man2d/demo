class Banner < ActiveRecord::Base
  mount_uploader :image, BannerUploader
end
