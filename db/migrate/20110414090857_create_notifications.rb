class CreateNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.text :notification
      t.text :user_ids

      t.timestamps
    end
  end

  def self.down
    drop_table :notifications
  end
end
