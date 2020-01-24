class FeedbacksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_feedback, only: [:show, :edit, :update]

  def index
    if current_user.admin
      @feedbacks = Feedback.all
    else
      @feedbacks = Feedback.where(:creator_id => current_user.id)
    end
    @your_feedbacks = Feedback.where(:team_id => current_user.team_id)
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.creator_id = current_user.id
    if @feedback.save
      redirect_to '/feedbacks'
    else
      flash.now[:error] = @feedback.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @feedback.update_attributes(feedback_params)
      redirect_to(:action => 'show', :id => @feedback.id)
    else
      flash.now[:error] = @feedback.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  private
  def feedback_params
    params.require(:feedback).permit(:milestone_id, :team_id, :q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8,:q9,:q10,:q11,:oeq1,:oeq2,:oeq3)
  end

  def load_feedback
    if current_user.admin
      @feedback = Feedback.find(params[:id])
    else
      @feedback = Feedback.where(:creator_id => current_user.id).find(params[:id])
    end
  end
end
