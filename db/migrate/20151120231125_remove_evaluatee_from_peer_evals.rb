class RemoveEvaluateeFromPeerEvals < ActiveRecord::Migration
  def change
    remove_column :peer_evals, :evaluatee, :string
  end
end
