require 'howrah/render/text_base'

module Howrah
  module Render
    class H  < TextBase
      def default_options
        raise "method 'default_options' must be implemeted by subclass of H"
      end
      
      def initialize(generator, element, options = {})
        super
      end 

      def render
        pdf.formatted_text_box [text], options
      end
                       
    end
    
    class H1 < H

      def default_options
        @default_options ||= {:size => 32, :styles => [:bold] }
      end
      
      def initialize(generator, element, options = {})
        super
      end 
      
    end

    class H2 < TextBase

      def default_options
        @default_options ||= {:size => 26, :styles => [:bold, :italic] }
      end
      
      def initialize(generator, element, options = {})
        super
      end
    end

    class H3 < TextBase

      def default_options
        @default_options ||= {:size => 18, :styles => [:bold, :italic] }
      end
      
      def initialize(generator, element, options = {})
        super
      end
    end

    class H4 < TextBase

      def default_options
        @default_options ||= {:size => 14, :styles => [:bold, :italic] }
      end
      
      def initialize(generator, element, options = {})
        super
      end
    end

    class H5 < TextBase

      def default_options
        @default_options ||= {:size => 12, :styles => [:bold, :italic] }
      end
      
      def initialize(generator, element, options = {})
        super
      end
    end

    class H6 < TextBase

      def default_options
        @default_options ||= {:size => 12, :styles => [:italic] }
      end
      
      def initialize(generator, element, options = {})
        super
      end
    end


  end
end
