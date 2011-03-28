class Item::SpecificationImage < Asset
  has_attached_file :attachment, :styles => {:thumb => "130x100", :normal => "400x300#", :big => "1024x768", 
    :small_wallpaper => "1024x768!", :medium_wallpaper => "1280x800!", :big_wallpaper => "1280x1024!"}
end