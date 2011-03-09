class CreateItemProperties < ActiveRecord::Migration
  def self.up
    create_table :item_properties do |t|
      t.integer :property_id
      t.integer :item_id
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :item_properties
  end
end
