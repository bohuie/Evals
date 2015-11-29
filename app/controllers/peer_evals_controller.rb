class PeerEvalsController < ApplicationController
  before_filter :load_peer_eval, only: [:show, :edit, :update]

  def index
    if current_user.admin 
      @peer_evals = PeerEval.all
      @your_evals = []
    else
      @peer_evals = PeerEval.where(:creator_id => current_user.id)
      @your_evals = PeerEval.where(:user_id => current_user.id)
    end
  end

  def new
    @peer_eval = PeerEval.new
  end

  def create
    @peer_eval = PeerEval.new(peer_eval_params)
    @peer_eval.creator_id = current_user.id
    if @peer_eval.save
      redirect_to '/peer_evals'
    else
      render 'new'
    end
  end

  def show
    @student = @peer_eval.user_id
  end

  def edit
  end

  def update
    if @peer_eval.update_attributes(peer_eval_params)
      redirect_to(:action => 'show', :id => @peer_eval.id)
    else
      render 'edit'
    end
  end

  private
  def peer_eval_params
    params.require(:peer_eval).permit(:milestone, :user_id, :goals, :quality, :effort, :considerate, :knowledge, :sharing, :strength, :weakness)
  end

  def load_peer_eval
    if current_user.admin 
      @peer_eval = PeerEval.find(params[:id])
    else
      @peer_eval = PeerEval.where(:creator_id => current_user.id).find(params[:id])
    end
  end
end
