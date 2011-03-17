module Howrah
  module Render
    class Li < Base    
      attr_accessor :pdf, :default_options
                          
      # should have access to parent elem  
      def initialize(generator, element, options = {})
        super
      end 

      # dependng on font size?
      def bullet_radius
         10
      end

      def current_list_type
        :ordered
      end
      
      def render
        send :"render_#{current_list_type}"          
      end

      protected
        def render_ordered
          raise "Not yet implemented"
          # indent(20) do
          #     stroke do
          #       circle_at [0,0], :radius => bullet_radius
          #     end
          # 
          #     formatted_text_box( :text => "The rain in spain falls mainly on the plains ", options)
          #   end
          # end              
        end

        def render_unordered                           
          raise "Not yet implemented"          
        end      
    end

    class Ol  < P 
      def valid_list_styles
        [ :decimal, :upper_roman, :lower_alpha ]
      end
         
      def initialize(generator, element, options = {})
        super
      end 
    end        

    class Ul  < P      
      def valid_list_styles
        [
        :circle,  # The marker is a circle
        :disc,    # The marker is a filled circle. This is default
        :square   # The marker is a square    
        ]
      end
    
      def initialize(generator, element, options = {})
        super
      end 
    end        
  end  
end