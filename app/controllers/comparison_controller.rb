class ComparisonController < ApplicationController
  def index
    if session[:comparison] && session[:comparison].size
      @items = Item.find(session[:comparison])
    else
      redirect_to '/catalog'
    end
  end
  
  def add
    session[:comparison] ||= []
    @id = params[:id].to_i
    unless session[:comparison].include? @id
      session[:comparison] << @id
      @action = "add"
    else
      session[:comparison].delete @id
      @action = "delete"      
    end
    respond_to do |format|
      format.js
      format.html {       
        if session[:comparison].size > 0 
          redirect_to :back 
        else
          redirect_to '/catalog'
        end
        }
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
