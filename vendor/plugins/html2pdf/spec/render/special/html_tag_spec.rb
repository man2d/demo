require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Html#render" do

  before(:each) do
    @doc = Prawn::Document.new(:page_size => "A4")    
  end      

  it "should skip empty <html> element" do
    html = %Q{<html></html>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!
    
  end

  # it "should ignore html style so body style is only italic" do
  #   html = %Q{<html style="font-weight: bold"><body style="font-style: italic">Hello World</body></html>}
  # 
  #   Howrah::Generator.with(@doc) do
  #     apply_html(html)
  #   end      
  #   # use prawn inspection to see if the result is right!    
  # end   
  
end
