class MembersController < ApplicationController
  before_filter :authenticate_user!
  def index
    @page = Page.find_by_slug("members")
    @members = User.where(:activated => true).all
  end
end
