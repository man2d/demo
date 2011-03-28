class CreateResumeJobs < ActiveRecord::Migration
  def self.up
    create_table :resume_jobs do |t|
      t.date :started_at
      t.date :finished_at
      t.string :title
      t.string :job

      t.timestamps
    end
  end

  def self.down
    drop_table :resume_jobs
  end
end
