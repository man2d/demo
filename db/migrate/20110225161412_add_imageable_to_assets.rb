class AddImageableToAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :assetable_id, :integer
    add_column :assets, :assetable_type, :string
  end

  def self.down
    remove_column :assets, :assetable_type
    remove_column :assets, :assetable_id
  end
end
