class GroupEvalsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_group_eval, only: [:show, :edit, :update]

  def index
    @group_evals = GroupEval.where(:creator_id => current_user.id)
    @your_group_evals = GroupEval.where(:team_id => current_user.team_id)
  end

  def new
    @group_eval = GroupEval.new
  end

  def create
    @group_eval = GroupEval.new(group_eval_params)
    @group_eval.creator_id = current_user.id
    if @group_eval.save
      redirect_to '/group_evals'
    else
      flash.now[:error] = @group_eval.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @group_eval.update_attributes(group_eval_params)
      redirect_to(:action => 'show', :id => @group_eval.id)
    else
      flash.now[:error] = @group_eval.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  private
  def group_eval_params
    params.require(:group_eval).permit(:milestone_id, :creator_id, :team_id, :presentation, :answering, :contribution, :questions, :strength, :weakness)
  end

  def load_group_eval
    if current_user.admin 
      @group_eval = GroupEval.find(params[:id])
    else
      @group_eval = GroupEval.where(:creator_id => current_user.id).find(params[:id])
    end
  end
end
