class Admin::SortController < Admin::BaseController
  def sort
    @models = eval(params[:model].singularize.capitalize+".find(params[:"+params[:model].singularize+"])")
  #  logger.info params[:banner]
    render :text => ""

    @models.each do |m|
      m.position = params[params[:model].singularize.to_sym].index(m.id.to_s) + 1
      m.save
    end

  end
end
