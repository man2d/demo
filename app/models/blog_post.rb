class BlogPost < ActiveRecord::Base
  belongs_to :blog_topic
  belongs_to :user
    acts_as_taggable_on :tags
    acts_as_commentable
    
    validates_presence_of :user, :title, :content
end
