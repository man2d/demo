module Howrah
  module Render
    module Styles   
      class CssStyle
        module Parser        
          def parse_declarations(style_declarations)
            # iterate array with hashes of style_declaration
            style_declarations.each do |decl|
              # parse value of style_declaration, not the key!
              parse_style_declaration(decl[1])
            end
            self
          end    

          def parse_style_declaration(style_declaration)
            method = style_declaration.property.underscore
            value = style_declaration.value.to_sym
            # puts "method: #{method}(#{value.inspect})"
            send :"#{method}=", value
          end
        end
      end
    end
  end
end