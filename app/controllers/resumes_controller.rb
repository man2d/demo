#coding: utf-8
class ResumesController < ApplicationController
  before_filter :authenticate_user!
  def new
    @resume = current_user.resumes.build
    @resume.resume_educations.build
    @resume.resume_jobs.build
  end
  
  def edit
    @resume = current_user.resumes.find(params[:id])
    @resume.resume_educations.build if @resume.resume_educations.size < 1
    @resume.resume_jobs.build if @resume.resume_jobs.size < 1
#=begin
#    @resume.resume_educations.build(:edu_type => "normal") unless @resume.resume_educations.where(:edu_type => "normal").size
#    @resume.resume_educations.build(:edu_type => "second") unless @resume.resume_educations.where(:edu_type => "second").size
#    @resume.resume_educations.build(:edu_type => "additional") unless @resume.resume_educations.where(:edu_type => "additional").size
#=end
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
    @resume = Resume.find(params[:id])
  end
  
  def update
    @resume = Resume.find(params[:id])
    if @resume.update_attributes(params[:resume])
       flash[:notice] = "Резюме сохранено"
       redirect_to user_path(current_user)
    else
      render 'update'
    end
  end
end
