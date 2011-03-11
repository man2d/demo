class AddCachingUrlToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :cached_url, :string
  end

  def self.down
    remove_column :pages, :cached_url
  end
end
