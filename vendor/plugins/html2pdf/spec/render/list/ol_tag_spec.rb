require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Ol#render" do

  before(:each) do
    @doc = Prawn::Document.new(:page_size => "A4")    
  end      

  it "should skip empty <ol> element" do
    html = %Q{<ol></ol>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end

  it "should skip <ol> with only text elements" do
    html = %Q{
    <ol>Don't show me</ol>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should skip <ol> without any <li> elements" do
    html = %Q{
    <ol><span>Don't show me</span></ol>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   


  it "should render <ol> with <li> element" do
    html = %Q{
    <ol><li>Show me</li></ol>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should render <ol> within other <ol> container element" do
    html = %Q{
    <ol><li><ol><li>Show me</li></ol></li></ol>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end

  it "should render <ol> within <ul> container element" do
    html = %Q{
    <ul><li><ol><li>Show me</li></ol></li></ul>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end

  
end
