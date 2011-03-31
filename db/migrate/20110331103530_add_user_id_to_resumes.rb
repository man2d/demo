class AddUserIdToResumes < ActiveRecord::Migration
  def self.up
    add_column :resumes, :user_id, :integer
  end

  def self.down
    remove_column :resumes, :user_id
  end
end
