require 'howrah/style/style_mapper'
require 'howrah/style/style_parser'

module Howrah
  module Render
    module Styles   
      class CssStyle
        attr_accessor :font_style, :font_weight, :font_size, :font_family, :color, :background_color
        attr_accessor :border_style, :border_width

        include StyleMapper
        include Parser

        def self.directions
          [:left, :right, :top, :bottom]
        end

        # generate accessors for all variants of margin, margin_left, padding etc
        [:margin, :padding].each do |name|   
          attr_accessor name
          directions.each{|dir| attr_accessor :"#{name}_#{dir}" }
        end
           
        def initialize        
          # set defaults        
          @font_size = 10       
          @font_family = "Helvetica"
          @color = "000000"
        end

        def self.parse(style_declarations)
          return if !style_declarations
          self.new.parse_declarations(style_declarations)
        end    

        def margin
          return @margin if @margin
          margins = {}        
          CssStyle.directions.each do |dir| 
            value = send :"margin_#{dir}"
            margins[dir] = value if value
          end    
          return nil if margins == {} 
          margins
        end

        def padding
          return @padding if @padding
          paddings = {}
          CssStyle.directions.each do |dir| 
            value = send :"padding_#{dir}"
            paddings[dir] = value if value
          end
          return nil if paddings == {}           
          paddings
        end


        def color=(col)
          @color = Colorist::ColorNames.color(col, :lower).sub /#/, ''
        end

        def background_color=(col)
          @background_color = Colorist::ColorNames.color(col, :lower).sub /#/, ''
        end

        def font_size
          @font_size.to_s.to_i        
        end

        # underline, strikethrought, ??? Not sure
        def pdf_font_style                
          style = font_weight == :bold ? "#{font_weight}_" : "" 
          style += "#{font_style}" if font_style == :italic
          style.empty? ? nil : style.to_sym               
        end

        def styles
          return @styles if @styles
          @styles ||= []        
          @styles << font_weight if font_weight
          @styles << font_style if font_style
        end
      
      end
    end
  end
end