class Admin::SortController < ApplicationController
  def sort
    @models = eval(params[:model].singularize.capitalize+".all")
  #  logger.info params[:banner]
    render :text => ""

    @models.each do |m|
      m.position = params[params[:model].singularize.to_sym].index(m.id.to_s) + 1
      m.save
    end

  end
end
