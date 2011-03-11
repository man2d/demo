class CreateItemAssigns < ActiveRecord::Migration
  def self.up
    create_table :item_assigns do |t|
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :item_assigns
  end
end
