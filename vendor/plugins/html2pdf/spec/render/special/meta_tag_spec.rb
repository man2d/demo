require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Meta#render" do

  before(:each) do
    @doc = Prawn::Document.new(:page_size => "A4")    
  end      

  it "should skip empty <meta> element" do
    html = %Q{<meta></meta>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!
    
  end

  it "should ignore <meta> element content" do
    html = %Q{<meta>Hello</meta>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!
    
  end

  it "should ... head ?? " do
    html = %Q{
    <head>  
      <meta name="description" content="Free Web tutorials on HTML, CSS, XML, and XHTML" /> 
    </head>  
    }

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!
    
  end


  it "should parse <meta> element content" do
    html = %Q{
      <meta name="description" content="Free Web tutorials on HTML, CSS, XML, and XHTML" /> 
    }

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!
    
  end


  it "should parse multiple <meta> elements" do
    html = %Q{
      <meta name="description" content="Free Web tutorials on HTML, CSS, XML, and XHTML" /> 
      <meta name="keywords" content="HTML, DHTML, CSS, XML, XHTML, JavaScript" /> 
    }

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  
end
