require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Span#render" do

  before(:each) do
    @doc = Prawn::Document.new(:page_size => "A4")    
  end

  it "should skip empty <span> element" do
    html = %Q{<span></span>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should display Hello World inline" do
    html = %Q{<span>Hello World</span>}
    
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end    
  end   

  it "should display inline text with CSS color" do
    html = %Q{<span style="color: #0f0;">Hello Kitty</span>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end    
  end   

  it "should merge inner span style to override outer style (red) so text becomes blue and bold" do
    html = %Q{<span style="color: red"><span style="color: blue; font-weight: bold">Hello Kitty</span>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end    
  end   

  it "should merge inner span style to override outer style (red, bold) so text becomes blue and bold" do
    html = %Q{<span style="color: red; font-weight: bold"><span style="color: blue;">Hello Kitty</span>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end    
  end   


  it "should diaplay inline text with CSS font style" do
    html = %Q{<span style="font-size:10; font-weight:bold; font-style: italic">Hello Kitty</span>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end    
  end   

end



