class AddCreatorToPeerEvals < ActiveRecord::Migration
  def change
    add_column :peer_evals, :creator_id, :int
  end
end
