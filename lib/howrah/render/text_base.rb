require 'howrah/render/base'

module Howrah
  module Render
    class TextBase < Base    
      attr_accessor :text, :default_options
        
      def initialize(generator, element, options = {})
        super
        @text = element.to_s
      end 
      
      def render
        raise "method 'render' must be implemeted by subclass!"
      end
    end

    class FormatTextBase < TextBase            
      def initialize(generator, element, options = {})
        super
      end 
      
      def before_render
        style = styles.pop
        pdf_style = style.to_pdf_style_options              
      end
      
      def render
        with_pdf_style do
          txt = {:text => txt}, pdf_style
          texts << txt
        end
      end
      
      def after_render 
      end
    end

    # Display basic text node!?
    class Text < TextBase
      def default_options
        {}
      end
      
      def initialize(generator, element, options = {})
        super
      end 

      def render
        pdf.formatted_text_box [text], options
      end
                       
    end


  end
end
