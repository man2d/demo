module Howrah
  module Render
    module Styles   
      # styles contains stack of styles for each element
      # merged_styles a stack containing the resulting style for each element when merged with the previous containing style 
      # current style is the last merged style
      
      # NOTE: not sure if the 'pure' styles stack is necessary, but a nice-to have to keep around, and useful for debugging etc.
      
      def element_style(element)
        CssStyle.parse(element.declarations)
      end

      def with_style(style, &block)
        puts "with style: #{style}" 

        if !style              
          puts "yield current style: #{current_style}"                  
          yield current_style        
          return
        end
        
        styles << style                        
        pdf_style = style.to_pdf_style
        merged_style = current_style.merge(pdf_style)
        merged_styles << merged_style

        puts "yield merged style: #{merged_style}"                
        yield merged_style 
        puts "pop style: #{current_style}"                

        styles.pop
        merged_styles.pop
      end

      def with_element(element, &block)
        elements << element
        yield element 
        elements.pop
      end

      def with_element_and_style(element, &block)
        puts "with_element_and_style: #{element.name}"        
        style = element_style(element)
        puts "element style: #{style}"
        with_element element do |element|
          with_style style do |style|
            yield element, style
          end
        end
      end
    end
  end
end