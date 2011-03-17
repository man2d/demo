module Howrah
  module ClassHelper
    def renderer_clazz_name(element)
      "Howrah::Render::#{element.name.camelize}"
    end

    def constantize(camel_cased_word)
      names = camel_cased_word.split('::')
      names.shift if names.empty? || names.first.empty?
      constant = Object
      names.each do |name|
        constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
      end
      constant
    end

    def renderer_clazz(element)
      begin
        key = element.name.to_sym
        if !state.renderers[key]
          # attempt to update registry with renderer class
          clazz_name = renderer_clazz_name(element) 
          state.renderers[key] = constantize(clazz_name)
        end
        clazz = state.renderers[key]
      rescue
        puts "No renderer registered for #{key}"
      end
    end
  end
end