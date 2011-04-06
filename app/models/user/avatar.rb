class User::Avatar < Asset
  has_attached_file :attachment, :styles => {:normal => "116x116#", :thumb => "31x31#"}, :default_url => "/images/pblogPhotoDummy.gif"
  belongs_to :user
end