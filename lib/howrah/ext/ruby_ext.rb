class String
  def camelize
    self.split(/[^a-z0-9]/i).map{|w| w.capitalize}.join
  end

  def underscore
    self.gsub(/-/, '_')
  end 


end
