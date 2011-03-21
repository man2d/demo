class AddConfirmToke43ToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :confirmation_sent_at, :date
  end

  def self.down
    remove_column :users, :confirmation_sent_at
  end
end
