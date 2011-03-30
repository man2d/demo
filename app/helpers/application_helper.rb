# coding: utf-8
module ApplicationHelper
  
  def link_to_add_fields(name, f, association)  
   new_object = f.object.class.reflect_on_association(association).klass.new  
   fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|  
     render(association.to_s.singularize + "_fields", :f => builder)  
   end  
   link_to_function(name, ("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))  
  end
  
  def link_to_remove_fields(name, f)  
       f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", :class => :delete)
  end
  
  def link_or_span(page)
    if page.url == "/"+params[:path]+"/"
      klass = "current" 
      content_tag = "p" 
    end
    html = ""
    html += content_tag(:li, :class => klass) do 
      if content_tag == 'p'
        content_tag(:p) do
          raw page.title + content_tag(:span, "→")
        end
      else
        link_to page.title, page.url
      end

    end
  end
end
