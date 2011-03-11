class AddLgthToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :lgth, :integer
  end

  def self.down
    remove_column :items, :lgth
  end
end
