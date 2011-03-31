class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :resume_educations
  has_many :resume_jobs
  has_many :assets, :as => :assetable, :class_name => "Resume::Asset", :dependent => :destroy
#  has_one :resume_normal_education, :class_name => "ResumeEducation"
  accepts_nested_attributes_for :resume_jobs, :resume_educations, :assets, :allow_destroy => true
  
end
