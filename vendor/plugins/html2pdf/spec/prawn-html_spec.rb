require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "PrawnHtml" do
  
  # it "should display bold text in pdf" do
  # 
  #   simple_html = 'Hello Kitty'    
  #   
  #   PdfGenerator::Html.generate('kitty.pdf') do 
  #     apply(simple_html)
  #   end     
  # end   
  
  
  it "should display bold text in pdf" do

    simple_html = '<p style="font-size:20; background_color: gray; color: red">Katty</p>'    

    doc = Prawn::Document.new(:page_size => "A4")    
    # Howrah::Generator.with('kitty_adv.pdf') do
    Howrah::Generator.with(doc) do
      apply_html(simple_html)
    end    
  end   

end
