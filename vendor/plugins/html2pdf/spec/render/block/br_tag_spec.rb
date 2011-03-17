require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Br#render" do

  before(:each) do
    @doc = Prawn::Document.new(:page_size => "A4")    
  end      

  it "should apply newline for <br> element: : hello | world" do
    html = %Q{<body>hello<br/>world</body>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should apply double newline for 2 <br> elements: : hello || world" do
    html = %Q{<body>hello<br/><br/>world</body>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should apply newline for each <br> element: hello | cruel | world" do
    html = %Q{<body>hello<br/>cruel<br/>world</body>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   
end