require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Dl#render" do

  VALID = %q{
    <dl>
      <lh>header</lh>
      <dt>blip</dt>
      <dt>blap</dt>
    </dl>        
  }

  before(:each) do
    @doc = Prawn::Document.new(:page_size => "A4")    
  end      

  it "should apply newline after <div> element: hello | world" do
    html = %Q{<div>hello<div/>world}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should not apply double newline for <div> element with display:inline style: hello world" do
    html = %Q{<div style="display: inline">hello<div/>world}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should display inner inline elements in one line and then newline after div" do
    html = %Q{
      <div style="color: red; border-width: 1; border-color: blue">
        <span>hello</span>dark and <b>cruel</b>
      <div/>
      world
    }

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should display inner block elements as blocks" do
    html = %Q{
      <div style="color: blue; border-width: 1; border-color: blue">
        Outer
        <div style="color: green; border-width: 1; border-color: green">
          Inner
        </div>
        Outer again
      <div/>
      body text
    }

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

end