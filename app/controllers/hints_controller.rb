#require "erb"
#include ERB::Util
class HintsController < ApplicationController
  def show
    @hint = Hint.find_by_word(params[:id])
    if @hint
      render :text => @hint.description
    else
      render :text => '', :status => 500
    end
  end
  def random
    @hint = Hint.order("RAND()").limit(1).first
    if @hint
      render :text => @hint.description
    else 
      render :text => '', :status => 500
    end
  end
  
  def next
    @hint = Hint.find(params[:id])
    @next_hint = Hint.where("id > ?", @hint.id).first
    @next_hint = Hint.first unless @next_hint
    if @hint
      @hint.id = @next_hint.id
      render :json => @hint
    else
      render :text => '', :status => 500
    end
  end
end
