class CreateResumeEducations < ActiveRecord::Migration
  def self.up
    create_table :resume_educations do |t|
      t.integer :edu_type
      t.integer :status
      t.string :title
      t.string :speciality

      t.timestamps
    end
  end

  def self.down
    drop_table :resume_educations
  end
end
