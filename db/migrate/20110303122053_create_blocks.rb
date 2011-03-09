class CreateBlocks < ActiveRecord::Migration
  def self.up
    create_table :blocks do |t|
      t.integer :attachable_id
      t.string :attachable_type
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :blocks
  end
end
