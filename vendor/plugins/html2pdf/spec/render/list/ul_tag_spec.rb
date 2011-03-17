require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Ul#render" do

  before(:each) do
    @doc = Prawn::Document.new(:page_size => "A4")    
  end      

  it "should skip empty <ul> element" do
    html = %Q{<ul></ul>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end

  it "should skip <ul> with only text elements" do
    html = %Q{
    <ul>Don't show me</ul>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should skip <ul> without any <li> elements" do
    html = %Q{
    <ul><span>Don't show me</span></ul>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   


  it "should render <ul> with <li> element" do
    html = %Q{
    <ul><li>Show me</li></ul>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should render <ul> within other <ul> container element" do
    html = %Q{
    <ul><li><ul><li>Show me</li></ul></li></ul>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end

  it "should render <ul> within <ol> container element" do
    html = %Q{
    <ol><li><ul><li>Show me</li></ul></li></ol>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end
  
end
