module Admin::FormsHelper
  def disabled_nested_set_options(class_or_item, mover = nil)
            class_or_item = class_or_item.roots if class_or_item.is_a?(Class)
            items = Array(class_or_item)
            result = []
            items.each do |root|
              result += root.self_and_descendants.map do |i|
                if mover.nil? || mover.new_record? || mover.move_possible?(i)
                  [yield(i), i.id]
                end
              end.compact
            end
            result
  end
end