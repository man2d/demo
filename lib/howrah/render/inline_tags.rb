require 'howrah/render/text_base'

module Howrah
  module Render
    class Span  < TextBase
      def default_options
        @default_options ||= {}
      end
      
      def initialize(generator, element, options = {})
        super
      end 

      def render                        
        pdf.formatted_text_box [text], options
      end                       
    end

    class B  < FormatTextBase      
      def initialize(generator, element, options = {})
        super
      end 
      
      def format_text
        default_options[:styles] << [:bold]
      end            
    end

    class I  < FormatTextBase      
      def initialize(generator, element, options = {})
        super
      end 
      
      def format_text
        default_options[:styles] << [:italic]
      end      
    end

    class U < FormatTextBase      
      def initialize(generator, element, options = {})
        super
      end 
      
      def configure
         default_options[:styles] << [:underline]
      end      
    end

    class Em  < I
      def initialize(generator, element, options = {})
        super
      end       
    end

    class Strong  < B
      def initialize(generator, element, options = {})
        super
      end       
    end

    class A < FormatTextBase
      def initialize(generator, element, options = {})
        super
      end       

      def uri
        options[:href]
      end        
      
      def format_text
        "a href='#{uri}'"
      end   
      
    end


    class Big  < FormatTextBase      
      def initialize(generator, element, options = {})
        super
      end 

      # DRY
      def configure 
        font_size = pdf.font.size + (pdf.font.size / 3).round
        default_options[:size => font_size]
      end                  
    end

    class Small  < FormatTextBase      
      def initialize(generator, element, options = {})
        super
      end 

      # DRY      
      def configure 
        font_size = [pdf.font.size - (pdf.font.size / 3).round, 6].min
        default_options[:size => font_size]
      end                  
    end


  end
end
