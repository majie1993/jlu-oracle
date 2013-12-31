require 'carrierwave/orm/activerecord'

class ProjectsController < ApplicationController
  before_action :signed_in_user, only:[:show, :index, :edit, :update, :destroy]
  before_action :belong_to_this_project, only: [:show, :index, :edit, :update, :destroy]
  
  def show
    @project = Project.find(params[:id])
  end
  
  def show_files
    @project = Project.find(params[:id])
  end
  
  def update
    redirect_to root_path
  end
  
  
  private
    
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end 
    
    # 判断用户是否是这个团队中的人，进而判断是否有权利看这个项目
    def belong_to_this_project
      @project = Project.find(params[:id])
      
      if Teams_User.where(user_id: current_user[:id], team_id: @project.team_id).first.nil?
        redirect_to root_path, notice: "你不是这个团队中的人"
      end
    end
end
