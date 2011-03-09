class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :filename
      t.integer :item_id
      t.integer :asset_group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
