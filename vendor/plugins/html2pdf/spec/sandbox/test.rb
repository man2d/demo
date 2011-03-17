class A
  def render
    puts "A.render"
  end
end  

class B < A
  def render
    super
    puts "B.render"
  end
end

B.new.render