require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "P#render" do

  before(:each) do
    @doc = Prawn::Document.new(:page_size => "A4")    
  end      

  it "should apply newline after <p> element: hello | world" do
    html = %Q{<p>hello<p/>world}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should not apply double newline for <p> element with display:inline style: hello world" do
    html = %Q{<p style="display: inline">hello<p/>world}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should display inner inline elements in one line and then newline after <p>" do
    html = %Q{
      <p style="color: red; border-width: 1; border-color: blue">
        <span>hello</span>dark and <b>cruel</b>
      <p/>
      world
    }

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should display inner <p> elements as blocks" do
    html = %Q{
      <p style="color: blue; border-width: 1; border-color: blue">
        Outer
        <p style="color: green; border-width: 1; border-color: green">
          Inner
        </div>
        Outer again
      <p/>
      body text
    }

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

end