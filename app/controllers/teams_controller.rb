class TeamsController < ApplicationController
  before_action :signed_in_user, only:[:show_members, :show, :show_members, :index, :edit, :update, :destroy]
  #before_action :correct_user, only: [:edit, :update]
  
  def new
    @team = Team.new
    @team_user = Teams_User.new
  end
  
  
  def create
    @team = Team.new(creator_id: current_user[:id], name: team_params[:name])
    
    if @team.save
      flash[:success] = "Create Successful"
      @team_user = Teams_User.new(user_id: current_user[:id], team_id: @team.id)
      @team_user.save
      redirect_to @team
    end
  end
  
  def show
    @team = Team.find(params[:id])
    @members = @team.users
    
  end
  
  def show_members
    @team = Team.find(params[:id])
    @members = @team.users
  end
  
  def add_members
    #puts "fsmdafof".red
    @team = Team.find(params[:id])
    if params[:users]
      @user = User.find_by_email(params[:users][:email])
      #puts @user.id.to_s.red
      @team_user = Teams_User.new(user_id: @user.id, team_id: params[:id])
      str = 
      @log = Log.new(team_id: params[:id], content: @user.name.to_s + " 加入了团队")
      if @team_user.save && @log.save!
        flash[:success] = "Add successfully"
        redirect_to @team
      end
    end
  end
  
  def show_projects
    @team = Team.find(params[:id])
    @projects = @team.projects
  end
  
  def add_projects
    @team = Team.find(params[:id])
    if params[:projects]
      @project = Project.new(team_id: params[:id], 
                            name: params[:projects][:name], 
                            description: params[:projects][:description])
      
      @log = Log.new(team_id: params[:id], content: current_user[:name].to_s + " 创建了项目 " + params[:projects][:name])
      if @project.save && @log.save!
        flash[:success] = "Create project successfully"
        redirect_to @project
      end 
    end
  end
  
  def show_logs
    @logs = Log.where(team_id: params[:id])
  end
  
  def destroy
    Team.find(params[:id]).destroy
    flash[:success] = "Team destroyed."
    redirect_to root_path
  end
  
  
  private
    def team_params
      params.require(:team).permit(:name)
    end
    
    def correct_user
      @user = User.find(current_user[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end 
end
