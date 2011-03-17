module Howrah
  module Render
    class Base      
      include Howrah::Render::Element
        
      def initialize(state, element, options = {})
        @state = state
        @element = element
        @options = options        
      end 

      def before_children
        puts "before children"
      end
      
      def render   
        puts "render"        
        before_children
        render_children
        after_children
      end               

      def render_children
        puts "render children"
        with_children element do |child|
          handle_element(child) if valid_child?(child)
        end
      end
      
      def after_children      
        puts "after children"        
      end

      def valid_child?(child) 
        true
      end
      
    end
  end
end
        