class AddFieldsToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :mileage, :integer
    add_column :items, :year, :integer
  end

  def self.down
    remove_column :items, :year
    remove_column :items, :mileage
  end
end
