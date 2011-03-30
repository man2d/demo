class AddAnnounceToBlogPosts < ActiveRecord::Migration
  def self.up
    add_column :blog_posts, :announce, :text
  end

  def self.down
    remove_column :blog_posts, :announce
  end
end
