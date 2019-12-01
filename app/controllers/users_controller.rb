class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter do 
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to(:action => 'show', :id => @user.id)
    else
      flash.now[:error] = @user.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :team_id, :client)
  end

end
