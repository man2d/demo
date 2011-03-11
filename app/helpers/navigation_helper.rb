module NavigationHelper
  def menu_link_or_p(controller, action, name)
    if params[:controller] == controller
      klass = "current" 
    else
	    klass = ""
    end
  
    if params[:controller] == controller && params[:action] == action
      content_tag = "p" 
    else 
	    content_tag = ""
    end
    
    html = ""
    html += content_tag(:li, :class => klass) do 
      if content_tag == 'p'
        content_tag(:p, name)
      else
        link_to name, "/"+controller
      end
    end
  end

  end

  def page_link_or_p(title, slug)
    if slug == params[:id]
      klass = "current" 
      content_tag = "p" 
    end
    html = ""
    html += content_tag(:li, :class => klass) do 
      if content_tag == 'p'
        content_tag(:p, title)
      else
        link_to title, "/pages/"+slug
      end

  end
  

end