class AddHandToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :on_hand, :boolean
  end

  def self.down
    remove_column :items, :on_hand
  end
end
