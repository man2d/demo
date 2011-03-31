class AddResumeIdToResumeJobs < ActiveRecord::Migration
  def self.up
    add_column :resume_jobs, :resume_id, :integer
  end

  def self.down
    remove_column :resume_jobs, :resume_id
  end
end
