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
    @hint = Hint.order("RAND()").limit(1)
    if @hint
      render :text => @hint.description
    else 
      render :text => '', :status => 500
    end
  end
end
