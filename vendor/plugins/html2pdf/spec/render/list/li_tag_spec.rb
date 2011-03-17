require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Li#render" do

  before(:each) do
    @doc = Prawn::Document.new(:page_size => "A4")    
  end      

  it "should skip empty <li> element" do
    html = %Q{<li></li>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end

  it "should skip <li> without valid list container element" do
    html = %Q{
    <li>Don't show me</li>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should render <li> within <ol> container element" do
    html = %Q{
    <ol><li>Show me</li></ol>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should render <li> within <ul> container element" do
    html = %Q{
    <ol><li>Show me</li></ol>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should NOT render <li> directly within other <li> container element" do
    html = %Q{
    <li><li>Show me</li></li>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   


  it "should NOT render <li> within <body> container element" do
    html = %Q{
    <body><li>Show me</li></body>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should NOT render <li> directly within other <li> container element" do
    html = %Q{
    <ol><li>Show me <li>Not show me</li></li></ol>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should render correctly nested <li> element" do
    html = %Q{
    <ul><li><ol><li><span>Show me </span><li></ol></li></ul>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  
end
