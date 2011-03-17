require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Table#render" do

  before(:each) do
    @doc = Prawn::Document.new(:page_size => "A4")    
  end      

  it "should skip empty <table> element" do
    html = %Q{<table></table>}

    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!
    
  end   

  it "should skip <table> element with no children" do
    html = %Q{
    <table cellpadding="2" style="color: red">
    </table>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should skip <table> element with only head and no body" do
    html = %Q{
    <table cellpadding="2" style="color: red">
      <thead>
        <th>
          <td>Name</td>
        </th>     
      </thead>
    </table>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should skip <table> element with only foot and no body" do
    html = %Q{
    <table cellpadding="2" style="color: red">
      <tfoot>
        <tf>
          <td>Name</td>
        </tf>     
      </tfoot>
    </table>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should skip <table> element with only head and foot but no body" do
    html = %Q{
    <table cellpadding="2" style="color: red">
      <thead>
        <th>
          <td>Name</td>
        </th>     
      </thead>
      <tfoot>
        <tf>
          <td>Name</td>
        </tf>     
      </tfoot>
    </table>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should render <table> with only body" do
    html = %Q{
    <table cellpadding="2" style="color: red">
      <tbody>
        <tr>
          <td>Name</td>
        </tr>     
      </tbody>
    </table>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  it "should render <table> with only body rows" do
    html = %Q{
    <table cellpadding="2" style="color: red">
      <tr>
        <td>Name</td>
      </tr>     
    </table>    
    }
    Howrah::Generator.with(@doc) do
      apply_html(html)
    end      
    # use prawn inspection to see if the result is right!    
  end   

  
end
