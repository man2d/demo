# coding: utf-8
module ApplicationHelper
  def link_to_add_resume_job(name, f, association)  
   new_object = f.object.class.reflect_on_association(association).klass.new  
   fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|  
     render(association.to_s.singularize + "_fields", :f => builder)  
   end  
   link_to_function(name, ("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"), :class => "submit formReady add")  
  end
  
  def link_to_add_fields(name, f, association)  
   new_object = f.object.class.reflect_on_association(association).klass.new  
   fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|  
     render(association.to_s.singularize + "_fields", :f => builder)  
   end  
   link_to_function(name, ("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))  
  end
  
  def link_to_remove_fields(name, f, klass = "")  
    if klass == ''
      @class = :delete
    else
      @class = :button
    end
       f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", :class => @class)
  end
  
  def link_or_span(page)
    if query_string[page.url]
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
  
  def file_extension(mime_type)
    mime_type.split('/').last
  end
  
  def query_string
    @uri = request.env['PATH_INFO']
    if @uri.last != '/'
      @uri += '/'
    end
  end
end
