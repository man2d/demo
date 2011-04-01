#require "erb"
#include ERB::Util
class HintsController < ApplicationController
  def show
    @hint = Hint.find_by_word(params[:id])
    render :text => @hint.description
  end
  def random
    @hint = Hint.order("RAND()").limit(1)
    render :text => @hint.description
  end
end
