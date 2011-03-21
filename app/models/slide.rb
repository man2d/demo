class Slide < ActiveRecord::Base
  mount_uploader :image, SlideUploader
  belongs_to :item
  default_scope :order => :position
end
