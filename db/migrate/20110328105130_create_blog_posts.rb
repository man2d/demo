class CreateBlogPosts < ActiveRecord::Migration
  def self.up
    create_table :blog_posts do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :blog_topic_id

      t.timestamps
    end
  end

  def self.down
    drop_table :blog_posts
  end
end
