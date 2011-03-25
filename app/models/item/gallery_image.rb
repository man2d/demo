class Item::GalleryImage < Asset
  has_attached_file :attachment, :styles => {:thumb => "110x82", :normal => "578x430#"}
end