#coding: utf-8
class ResumesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_page
  def new
    @resume = current_user.resumes.build
    @resume.resume_educations.build
    @resume.resume_jobs.build
  end
  
  def edit
    @resume = current_user.resume
    @resume.resume_educations.build if @resume.resume_educations.size < 1
    @resume.resume_jobs.build if @resume.resume_jobs.size < 1
#=begin
#    @resume.resume_educations.build(:edu_type => "normal") unless @resume.resume_educations.where(:edu_type => "normal").size
#    @resume.resume_educations.build(:edu_type => "second") unless @resume.resume_educations.where(:edu_type => "second").size
#    @resume.resume_educations.build(:edu_type => "additional") unless @resume.resume_educations.where(:edu_type => "additional").size
#=end
  end
  
  def index
    @resumes = Resume.all
  end
  
  def create
    @resume = current_user.resumes.build(params[:resume])
    if @resume.save
      flash[:notice] = "Резюме сохранено"
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end
  
  def show
    @resume = User.find_by_id(params[:user_id]).resume
  end
  
  def update
    @resume = current_user.resume
    if @resume.update_attributes(params[:resume])
       flash[:notice] = "Резюме сохранено"
       redirect_to user_path(current_user)
    else
      render 'update'
    end
  end
end
