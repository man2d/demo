class Item::InteriorImage < Asset
  has_attached_file :attachment, :styles => {:thumb => "130x100", :normal => "400x300"}
end