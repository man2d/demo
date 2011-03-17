require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Howrah::Generator do
  let(:filename1)               { 'kitty.pdf' }
  let(:filename2)               { 'cat.pdf' }
  let(:doc)                     { Prawn::Document.new(:page_size => "A4") }
  let (:html)                   { '<p>Katty</p>' }   
  let (:default_options)        { {:dry_run => true} }   
  
      
  it "should create generator from a file name" do
    Howrah::Generator.with filename1, default_options do |gen|
      gen.file_name.should == filename1    end    
  end   
  
  it "should change generator file name" do
    Howrah::Generator.with filename1, default_options do |gen|
      gen.file_name = filename2        
      gen.file_name.should == filename2
    end    
  end   
  
  it "should create generator from a doc" do    
    Howrah::Generator.with(doc) do |gen|     
      gen.pdf.should == doc 
    end    
  end   
  
  it "should not override default document options if document used to initialize" do    
    Howrah::Generator.with(doc, default_options.merge(:page_size => "A5")) do |gen|
      gen.pdf.should == doc 
      gen.pdf.page.size.should == "A4"
    end    
  end   
  
  it "should override default document options if filename used to initialize" do    
    Howrah::Generator.with(filename1, default_options.merge(:page_size => "A5")) do |gen|
      gen.pdf.page.size.should == "A5"
    end    
  end   
  
  
  it "should apply html" do    
    Howrah::Generator.with(doc) do |gen|
      gen.apply_html(html)
    end    
  end 
  
end
