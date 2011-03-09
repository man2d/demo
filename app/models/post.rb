class Post < ActiveRecord::Base
  @@per_page = 5
  mount_uploader :image, ImageUploader
end
