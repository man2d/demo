class AddAboutToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :about, :text
    add_column :users, :city, :string
    add_column :users, :phone, :string
    add_column :users, :receive_comments, :boolean
  end

  def self.down
    remove_column :users, :receive_comments
    remove_column :users, :phone
    remove_column :users, :city
    remove_column :users, :about
  end
end
