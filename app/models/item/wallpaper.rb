class Item::Wallpaper < Asset
  has_attached_file :attachment, :styles => {:thumb => "130x100", :small => "1024x768!", :medium => "1280x800!", :big => "1280x1024!"}
end