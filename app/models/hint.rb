class Hint < ActiveRecord::Base
  default_scope :order => :position
end
