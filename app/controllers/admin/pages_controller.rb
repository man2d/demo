class Admin::PagesController < Admin::BaseController
  inherit_resources
  respond_to :html, :xml, :json

  custom_actions :resource => [:menu, :hide]
  defaults :route_prefix => 'admin'
  
  def index
    super do |format|
      format.html { }
      format.json {
        render :json => collection.to_json(:methods => [:admin_path, :level])
#        collection.first.level.to_json
      }
      format.js { 
        render :update do |page|
          page.insert_html 'td:last', "hehahhae"
        end
      }
    end
  end
  
  def new
    @page = Page.new
    @page.build_image
  end
  
  def edit
    @page = Page.find(params[:id])
    @page.build_image unless @page.image
    edit!
  end
  
  def create
    create!(:notice => "Dude! Nice job creating that page. Yeeeah") { collection_url }
  end
  
  def update
    update!(:notice => "Good job guy!") { collection_url }
  end
  
  def menu
    render :partial => 'menu'
  end
  
  def tree_load
    
  end
  
  
  protected
  
  def collection
    @pages = Page.order(:position).all
  end    
  
=begin
    def collection
      if params[:level]
        @pages = Page.where(:cached_level => params[:level])
      elsif params[:parent_id].to_i > 0
        @pages = Page.where(:parent_id => params[:parent_id])
      else
        @pages = Page.roots
      end
    end
=end
end
