class CreateResumes < ActiveRecord::Migration
  def self.up
    create_table :resumes do |t|
      t.string :fio
      t.string :email
      t.date :birthdate
      t.string :phone
      t.text :more

      t.timestamps
    end
  end

  def self.down
    drop_table :resumes
  end
end
