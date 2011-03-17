module Howrah
  module Render
    module Styles   
      class CssStyle
        module StyleMapper
          def to_pdf_style
            pdf_styles = {}  

            # handle mappings
            css_to_pdf_style_mappings.each_pair do |css, pdf|
              value = send css
              pdf_styles[pdf] = value
            end      

            # 1-1 mappings where css style name is same as in prawn
            style_keys.each do |key|
              value = send key
              pdf_styles[key] = value if value
            end

            pdf_styles[:styles] = styles if styles

            pdf_styles[:underlays] = true
            pdf_styles
          end
        end

        protected
          
          def css_to_pdf_style_mappings
            {
              :font_size => :size,
              :font_family => :font,
              :background_color => :fill_color
            }
          end

          def style_keys
            [:color, :border_style, :border_width, :margin, :padding]
          end

      end
    end
  end
end