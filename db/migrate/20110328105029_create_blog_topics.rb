class CreateBlogTopics < ActiveRecord::Migration
  def self.up
    create_table :blog_topics do |t|
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :blog_topics
  end
end
