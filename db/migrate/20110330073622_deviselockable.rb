class Deviselockable < ActiveRecord::Migration
  def self.up
    add_column :users, :locked_at, :datetime
    add_column :users, :failed_attempts, :integer
    add_column :users, :unlock_token, :string
  end

  def self.down
  end
end
