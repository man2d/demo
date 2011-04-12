class AddVideoToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :video_html, :text
  end

  def self.down
    remove_column :items, :video_html
  end
end
