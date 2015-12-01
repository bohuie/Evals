class UsersController < ApplicationController
  before_filter :authenticate_admin, only: [:show, :edit, :update]

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
    params.require(:user).permit(:email, :last_name, :first_name, :team_id)
  end

  def authenticate_admin
    if current_user.admin 
      @user = User.find(params[:id])
    else
      redirect_to welcome_index_path
    end
  end
end
