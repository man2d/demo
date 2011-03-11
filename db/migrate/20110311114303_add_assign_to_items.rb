class AddAssignToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :item_assign_id, :integer
  end

  def self.down
    remove_column :items, :item_assign_id
  end
end
