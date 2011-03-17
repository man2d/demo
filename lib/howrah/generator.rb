require 'prawn'
require 'howrah/style/css_style'
require 'howrah/helper/all'
require 'howrah/render/all'
require 'howrah/ext/ruby_ext'
require 'howrah/state_manager'

module Howrah
  class Generator

    attr_accessor :file_name
    
    include Howrah::Render::Element

    def initialize(pdf)  
      @state = Howrah::StateManager.new pdf
    end

    def self.default_document_options    
      {:page_size => "A4"}
    end

    # create new generator with either an existing pdf document or by creating a new pdf document to write on
    def self.with(arg, document_options = {}, &block)
      options   = default_document_options.merge(document_options) 
      generator = new document(arg, options)
      generator.file_name  = arg
      if block
        block.arity < 1 ? generator.instance_eval(&block) : block.call(generator)
      end
      
      generator.pdf.render_file generator.file_name if generator.file_name && !options[:dry_run]
    end

    def apply_html(html)
      doc = Nokogiri::HTML.parse(html)
      doc = CSS::Model.apply_to(doc)
      # let the html handler handle the html element and take it from there
      handle_element(doc.css('html').first)
    end

    def file_name=(name) 
      @file_name = name if name.kind_of? String        
    end

    protected    
      def self.document(arg, options)
        case arg
        when String        
          # create a new pdf document to write on          
          Prawn::Document.new(options)
        when Prawn::Document
          # use an existing pdf document
          arg
        else
          raise ArgumentError, "#{arg} is not a valid argument for building a generator, must be a Prawn::Document or a String (filename)"
        end
      end
  end
end
