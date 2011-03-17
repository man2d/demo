module Howrah
  module Render
    module Element
      module Html    
        include Howrah::ClassHelper
        
        def handle_html_element(element, style)
          return if !element || !html_element?(element)

          # attempt to find 'registered' class for this type of html element
          clazz = renderer_clazz(element)
          if clazz
            renderer = clazz.new state, element, style
            # render the html element!
            renderer.render
          end
        end

        def element_id(element)
          element.name.to_sym
        end

        def html_or_text_element?(element)
          html_element?(element) || text_element?(element)         
        end

        def html_element?(element)
          element.kind_of? Nokogiri::XML::Element
        end

        def text_element?(element)
          element.kind_of? Nokogiri::XML::Text
        end

        def valid_children
          :all
        end

        def valid_child_element?(child)
          valid_children == :all || valid_children.include?(element_id(child))
        end

        def valid_child?
          true
        end

      end
    end
  end
end
