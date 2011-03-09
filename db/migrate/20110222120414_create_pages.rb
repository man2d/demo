class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.text :body
      t.boolean :status
      t.string :meta_keywords
      t.string :meta_description
      t.integer :rgt
      t.integer :lft
      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
