module Howrah
  class StateManager    
    attr_accessor :pdf, :renderers
    attr_accessor :styles, :merged_styles, :current_style      
    attr_accessor :elements, :texts
    
    def initialize(pdf)
      @renderers = {}
      @pdf = pdf

      @elements = []
      @texts = []

      init_styles
    end   

    def init_styles
      # add default style to bottom top style stack
      current_style = Howrah::Render::Styles::CssStyle.new
      @styles = [] << current_style
      @merged_styles = [] << current_style.to_pdf_style
    end
    
    def current_style
      merged_styles.last
    end        
    
  end
end
