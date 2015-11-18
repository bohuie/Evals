class PeerEvalsController < ApplicationController
  def index
    @peer_evals = PeerEval.all
  end
end
