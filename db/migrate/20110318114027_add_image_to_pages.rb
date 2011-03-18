class AddImageToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :image, :string
  end

  def self.down
    remove_column :pages, :image
  end
end
