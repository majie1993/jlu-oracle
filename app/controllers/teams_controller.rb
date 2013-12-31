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
      if @team_user.save
        flash[:success] = "Add successfully"
        redirect_to @team
      end
    end
    
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
