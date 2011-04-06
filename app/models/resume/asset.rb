class Resume::Asset < Asset
  has_attached_file :attachment
  belongs_to :resume
end