class User::Attachment < Asset
  has_attached_file :attachment
  belongs_to :user
end