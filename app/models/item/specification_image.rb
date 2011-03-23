class Item::SpecificationImage < Asset
  has_attached_file :attachment, :styles => {:thumb => "130x100"}
end