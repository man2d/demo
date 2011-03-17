require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "A#render" do

  before(:each) do
    @doc = Prawn::Document.new(:page_size => "A4")    
  end      

  it "should skip empty <a> element" do
    html = %Q{<a></a>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should skip <a> element without href" do
    html = %Q{<a>Don't show me</a>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should skip <a> element with empty href" do
    html = %Q{<a href="">Don't show me</a>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should skip <a> element without text" do
    html = %Q{<a href="example.com"></a>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   


  it "should show <a> element with href as a PDF link" do
    html = %Q{<a href="example.com">show me</a>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end
  
end
