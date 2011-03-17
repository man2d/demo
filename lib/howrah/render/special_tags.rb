module Howrah
  module Render
    class Html < Base    

      def valid_children
        [:head, :meta, :body]
      end

      def valid_child?(child)             
        html_element?(child) && valid_child_element?(child)        
      end      
        
      def initialize(generator, element, options = {})
        super
      end 

      def before_children
        super                        
      end
      
      def render
        super                        
      end
      
      def after_children
        super                        
      end
      
    end

    class Head < Base    
        
      def initialize(generator, element, options = {})
        super
      end 
      
      def render
        puts "HEAD tag"
      end
    end

    class Meta < Base    
        
      def initialize(generator, element, options = {})
        super
      end 
      
      def render
        puts "META tag"
      end
    end

    class Style < Base    
        
      def initialize(generator, element, options = {})
        super
      end 
      
      def render
        puts "STYLE tag"
      end
    end

    class Body < Base    
        
      def initialize(generator, element, options = {})
        super
      end 
      
      def render
        puts "BODY tag"
      end
    end
  end
end