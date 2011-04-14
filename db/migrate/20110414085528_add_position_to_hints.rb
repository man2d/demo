class AddPositionToHints < ActiveRecord::Migration
  def self.up
    add_column :hints, :position, :integer
  end

  def self.down
    remove_column :hints, :position
  end
end
