module Howrah
  module Render
    module Element
      module Text         
        def text_renderer_class
          Howrah::Render::Text
        end

        # the following should maybe instead be handled internally by renderer?  

        def handle_text_element(element)
          renderer = text_renderer_class.new(self, element, style)
          renderer.render!
        end

        # ??
        def clear
          texts = []
        end      
      end
    end
  end
end
