class ComparisonController < ApplicationController
  def index
    @items = Item.find(session[:comparison])
  end
  
  def add

    session[:comparison] ||= []
    @id = params[:id].to_i
    unless session[:comparison].include? @id
      session[:comparison] << @id
    else
      session[:comparison].delete @id
    end
    respond_to do |format|
      format.js
      format.html { redirect_to :back }
    end   
#    render :text => session
  end
  
  def list
  end
  
  def pdf
    require 'Howrah'
    simple_html = '

    Hello KittyKatty
    '    

    doc = Prawn::Document.new(:page_size => "A4")    
    Howrah::Html.generate(doc) do
      apply_html(simple_html)
    end

  end
end
