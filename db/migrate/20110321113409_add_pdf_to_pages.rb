class AddPdfToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :pdf, :string
  end

  def self.down
    remove_column :pages, :pdf
  end
end
