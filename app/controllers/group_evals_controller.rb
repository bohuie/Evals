class GroupEvalsController < ApplicationController
  before_filter :load_group_eval, only: [:show, :edit, :update]

  def index
    @group_evals = GroupEval.all
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

  private
  def group_eval_params
    params.require(:group_eval).permit(:milestone, :creator_id, :team, :presentation, :answering, :contribution, :questions, :strength, :weakness)
  end

  def load_group_eval
    if current_user.admin 
      @group_eval = GroupEval.find(params[:id])
    else
      @group_eval = GroupEval.where(:creator_id => current_user.id).find(params[:id])
    end
  end
end
