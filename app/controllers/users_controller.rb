class UsersController < ApplicationController
  before_filter :set_template, :create_avatar, :authenticate_user!
    
  def show
  end
  
  def sell_yacht
  end
  
  def pagestyle
  end
  
  def personal
  end

  protected
  def set_template
    @template = 2
  end  
  def create_avatar
    current_user.build_avatar if current_user && !current_user.avatar
    current_user.build_item if current_user && !current_user.item
  end
end
