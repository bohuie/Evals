class TeamsController < ApplicationController
  before_filter :authenticate_user!
  before_filter do 
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end

  def index
    @teams = Team.all
    render 'index'
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to '/teams'
    else
      flash.now[:error] = @team.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      redirect_to(:action => 'show', :id => @team.id)
    else
      render 'edit'
    end
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end
end
