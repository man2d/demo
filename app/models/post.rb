class Post < ActiveRecord::Base
  @@per_page = 5
  mount_uploader :image, ImageUploader
  acts_as_commentable
  acts_as_taggable_on :tags
end
