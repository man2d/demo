class CreateHints < ActiveRecord::Migration
  def self.up
    create_table :hints do |t|
      t.string :word
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :hints
  end
end
