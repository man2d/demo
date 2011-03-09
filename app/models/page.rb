class Page < ActiveRecord::Base
  acts_as_nested_set
  before_save :caching_level
  after_save :rebuild_tree

  has_many :blocks, :as => :attachable
  accepts_nested_attributes_for :blocks
  def admin_path
    ids = ["0"]
    self_and_ancestors.each do |a|
      ids << a.id
    end
    
    ids.join("/")
  end
  

  
  private
    
    def rebuild_tree
      Page.rebuild!
    end
    
    def caching_level
      self.cached_level = level
    end
  
=begin
  def to_xml
    self.to_xml do |xml|
      xml.level self.level
    end
  end
=end
end
