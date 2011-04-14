class Notification < ActiveRecord::Base
  serialize :user_ids
  default_scope :order => "created_at DESC"
end
