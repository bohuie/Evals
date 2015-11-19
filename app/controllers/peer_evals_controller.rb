class PeerEvalsController < ApplicationController
  def index
    @peer_evals = PeerEval.all
  end

  def new
    @peer_eval = PeerEval.new
  end

  def create
    @peer_eval = PeerEval.new(peer_eval_params)
    if @peer_eval.save
      redirect_to '/peer_evals'
    else
      render 'new'
    end
  end

  private
  def peer_eval_params
    params.require(:peer_eval).permit(:milestone, :evaluatee, :goals, :quality, :effort, :considerate, :knowledge, :sharing, :strength, :weakness)
  end
end
