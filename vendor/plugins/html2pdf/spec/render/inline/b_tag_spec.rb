require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "B#render" do

  before(:each) do
    @doc = Prawn::Document.new(:page_size => "A4")    
  end      

  it "should skip empty <i> element" do
    html = %Q{<i></i>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should display Hello World inline with font-style: italic" do
    html = %Q{<i>Hello World</i>}
    
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end    
  end   

  it "should display inline text in font-weight: bold, overriding outer weight" do
    html = %Q{<span style="font-weight: normal"><b>Hello Kitty</b></span>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end    
  end   

  it "should display inline text in font-weight: normal, overriding <b> weight" do
    html = %Q{<b><span style="font-weight: normal">Hello Kitty</span></b>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end    
  end   

  it "should display inline text in <b><i> with font-style: italic and font-weight: bold" do
    html = %Q{<b><i>Hello Kitty</i></b>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end    
  end
  
end
