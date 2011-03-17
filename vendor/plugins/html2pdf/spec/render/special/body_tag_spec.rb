require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Body#render" do

  before(:each) do
    @doc = Prawn::Document.new(:page_size => "A4")    
  end      

  it "should skip empty <body> element" do
    html = %Q{<body></body>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should merge body style with styles of child elements so div text style is bold AND italic" do
    html = %Q{<body style="font-weight: bold"><div style="font-style: italic">Hello World</div></body>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  
end
