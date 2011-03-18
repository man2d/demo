class AddItemToSlide < ActiveRecord::Migration
  def self.up
    add_column :slides, :item_id, :integer
  end

  def self.down
    remove_column :slides, :item_id
  end
end
