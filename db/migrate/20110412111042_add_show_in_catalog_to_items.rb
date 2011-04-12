class AddShowInCatalogToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :show_in_catalog, :boolean
  end

  def self.down
    remove_column :items, :show_in_catalog
  end
end
