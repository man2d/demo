class ItemProperty < ActiveRecord::Base
  belongs_to :item
  belongs_to :property
  
  validates :property, :presence => true
  validates :item, :presence => true
end
