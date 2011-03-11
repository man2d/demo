# coding: utf-8
module MenuHelper
  
  def main_menu
    list_menu_elements(Page.roots.all)
  end
  
  def list_menu_elements(nested_list)
    result = []
    result << content_tag(:ul, :class => :main_menu) do
      nested_list.each do |item|
        result << content_tag(:li, item.title)
        list_menu_elements(item.title) if item.children
      end
      
    end
    yield result.compact.to_s.html_safe
  end
end
