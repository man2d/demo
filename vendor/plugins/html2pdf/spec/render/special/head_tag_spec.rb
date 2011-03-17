require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Body#render" do

  before(:each) do
    @doc = Prawn::Document.new(:page_size => "A4")    
  end      

  it "should skip empty <head> element" do
    html = %Q{<head></head>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!
    
  end   

  it "should parse <style> inside <head>" do
    html = %Q{
    <head>
      <style>body {font-weight: bold}
    </head>
    <body>Hello</body>
    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  
end
