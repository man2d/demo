module Custom

  class SemanticFormBuilder < ActionView::Helpers::FormBuilder

    JS_FOR_COMBOSELECT = "<script type=text/javascript>
                            $(document).ready(function() {
                              $(#%s).comboselect();
                            });
                          </script>"

    private

    def cke(method, options)
      (JS_FOR_COMBOSELECT % "#{sanitized_object_name}_#{generate_association_input_name(method)}") << select_input(method, options)
    end
    
    private
    
    def inline_examples_for(method, options) #:nodoc:
      options[:example] = localized_string(method, options[:example], :example)
      return if options[:example].blank? or options[:example].kind_of? Hash
      hint_class = options[:example_class] || default_hint_class
      template.content_tag(:p, Formtastic::Util.html_safe(options[:example]), :class => hint_class)
    end

    def inline_example_for(method, options) #:nodoc:
      options[:example] = localized_string(method, options[:example], :example)
      return if options[:example].blank? or options[:example].kind_of? Hash
      hint_class = options[:example_class] || default_hint_class
      template.content_tag(:p, Formtastic::Util.html_safe(options[:example]), :class => hint_class)
    end
  end

end