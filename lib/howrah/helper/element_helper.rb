require 'howrah/helper/html_helper'
require 'howrah/helper/text_helper'

module Howrah
  module Render
    module Element          
      attr_accessor :state, :element
      
      def handle_element(element, type = :all)
        case element
        when Nokogiri::XML::Element                         
          handle_xml_element(element) if xml_element?(type)
        when Nokogiri::XML::Text
          handle_text_elem(element) if text_element?(type)
        end
      end

      def method_missing(name, *args, &block) 
        # puts "missing: #{name}"
        state.send(name, *args, &block) if state.respond_to? :"#{name}"
      end

      def with_children (element, &block)
        element.children.each do |child|
          yield child if html_or_text_element?(child)
        end
      end

      protected
        include Styles
        include Html
        include Text               
      
        def handle_xml_element(element)
          with_element_and_style element do |element, style|
            handle_html_element(element, style)
          end
        end
        
        def xml_element?(type)
          [:all, :xml].include? type
        end

        def text_element?(type)
          [:all, :text].include? type
        end
        
    end
  end

end
