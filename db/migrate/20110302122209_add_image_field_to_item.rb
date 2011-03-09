class AddImageFieldToItem < ActiveRecord::Migration
  def self.up
    add_column :items, :image, :string
  end

  def self.down
    remove_column :items, :image
  end
end
