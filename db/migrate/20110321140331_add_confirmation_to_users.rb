class AddConfirmationToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :confirmed_at, :date
  end

  def self.down
    remove_column :users, :confirmed_at
  end
end
