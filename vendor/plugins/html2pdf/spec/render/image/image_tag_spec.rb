require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Img#render" do

  before(:each) do
    @doc = Prawn::Document.new(:page_size => "A4")    
  end      

  it "should skip empty <img> element" do
    html = %Q{<img></img>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should skip <img> element without src" do
    html = %Q{<img width="200"/>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should skip <img> element with empty src" do
    html = %Q{<img src=""/>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should render <img> element with valid local src" do
    html = %Q{<img src="pictures/test.png"/>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should skip <img> element with invalid local src" do
    html = %Q{<img src="pictures/invalid.png"/>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   


  it "should render <img> element with valid remote src" do
    html = %Q{<img src="http://www.example.com/pictures/test.png"/>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should render <img> element with invalid remote src" do
    html = %Q{<img src="http://www.example.com/pictures/invalid.png"/>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  
end
