class User::Avatar < Asset
  has_attached_file :attachment, :styles => {:normal => "116x116#"}, :default_url => "/images/pblogPhotoDummy.gif"
  
end