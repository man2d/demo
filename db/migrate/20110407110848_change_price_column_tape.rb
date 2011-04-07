class ChangePriceColumnTape < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE  items CHANGE  price  price VARCHAR( 24 ) NULL DEFAULT NULL"
  end

  def self.down
  end
end
