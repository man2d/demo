#coding: utf-8
class HomeController < ApplicationController
  include ApplicationHelper
  in_place_edit_for :post, :title
  in_place_edit_for :item, :description
  in_place_edit_for :item, :announce
  in_place_edit_for :block, :content
  
  before_filter :find_page
  
  def set_post_title
        post = Post.find(params[:id]) 
        post.title = params[:value] # Name of parameter is always 'value'.
        post.save

        # It should render a text 
        render :text => post.title
  end
  
  def index
    @items = Item.brand_new.order("RAND()").limit(3)
    
    @posts = Post.order("updated_at DESC").limit(5)
    @blog_posts = BlogPost.order("updated_at DESC").limit(5)
    
    @page = Page.find_by_slug("main")
    @blocks = @page.blocks.limit(1) if @page
  end
  
  def show
    @page = Page.find_by_slug(params[:id])
    @page = Page.find(params[:id]) unless @page
  end
  
  def captain
    #render :text => query_string
    require 'pp'
    @g_spb = GoogleWeather.new('Saint-Petersburg')
#    require 'net/http'
#    require 'uri'

#       url = URI.parse('http://www.google.com/ig/api?weather=Moscow')
#        render :text => Net::HTTP.get_print(URI.parse('http://www.google.com/ig/api?weather=Moscow'))
#http = Net::HTTP.new
#http.start(url.host, url.port) { |http|
# response = http.post('http://www.google.com/ig/api', 'query=foo')
# }
# puts response.body       
        #req = Net::HTTP::Get.new(url.path)
        # res = Net::HTTP.start(url.host, url.port) {|http|
        #   http.request(req)
        # }
        # render :text => res.body, :format => :xml

#        res = Net::HTTP.start(url.host, url.port) {|http|
#          http.get('/ig/api/?weather=moscow')
#        }
#        render :text => res.body
    
    @g_msk = GoogleWeather.new('Moscow')
  end
  
  def owner
#    render :text => 
    @resumes = Resume.order(:created_at).limit(4).all
#        render :text => @resumes
  end

  
end
