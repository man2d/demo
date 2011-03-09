class AddLevelToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :cached_level, :integer
  end

  def self.down
    remove_column :pages, :cached_level
  end
end
