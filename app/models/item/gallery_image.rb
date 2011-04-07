class Item::GalleryImage < Asset
  has_attached_file :attachment, :styles => {:thumb => "108x82#", :normal => "578x430#"}
  belongs_to :item
end