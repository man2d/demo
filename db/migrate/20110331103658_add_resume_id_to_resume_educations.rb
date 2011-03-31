class AddResumeIdToResumeEducations < ActiveRecord::Migration
  def self.up
    add_column :resume_educations, :resume_id, :integer
  end

  def self.down
    remove_column :resume_educations, :resume_id
  end
end
