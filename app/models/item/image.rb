class Item::Image < Asset
  has_attached_file :attachment, :styles => {:thumb => "128x80", :normal => "400x300"}
end