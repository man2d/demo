require 'howrah/render/text_base'

module Howrah
  module Render
    class BlockBase < Base   
        
      def initialize(generator, element, options = {})
        super
      end 
      
      def render
        raise "method 'render' must be implemeted by subclass of BlockBase"
      end
    end    
    
    class P  < BlockBase
      def default_options
        @default_options ||= {:margin => {:top => 10} }
      end
      
      def initialize(generator, element, options = {})
        super
      end 

      def render                        
        # it should force a 'newline' from the previous rendering
        Br.new(pdf).render
                                        
        margin = {:margin => {:top => pdf.font.size} }
        options = default_options.merge margin
        pdf.formatted_text_box [text], options
      end                       
    end    
    
    class Div  < P      
      def initialize(generator, element, options = {})
        super
      end 
    end    

    class Img      
      attr_accessor :pdf, :uri, :options
        
      def initialize(generator, element, options = {})
        super(pdf)
        @uri = uri 
        @options = options
      end 
      
      def render                        
        # it should force a 'newline' from the previous rendering
        Br.new(pdf).render
        
        pdf.image uri, options
      end                       
      
    end        

    
    class Br  < BlockBase
      def default_options
        raise "method 'default_options' must be implemeted by subclass of H"
      end
      
      def initialize(generator, element, options = {})
        super
      end 

      def render
        move_down(pdf.font.size)        
      end
                       
    end
  end
end