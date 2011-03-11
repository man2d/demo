class AddPageIdToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :page_id, :integer
  end

  def self.down
    remove_column :items, :page_id
  end
end
