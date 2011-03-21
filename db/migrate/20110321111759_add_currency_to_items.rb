class AddCurrencyToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :currency, :string
  end

  def self.down
    remove_column :items, :currency
  end
end
