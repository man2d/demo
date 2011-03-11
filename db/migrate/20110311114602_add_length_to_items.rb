class AddLengthToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :length, :integer
  end

  def self.down
    remove_column :items, :length
  end
end
