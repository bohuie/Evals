class AddTeamIdToGroupEvals < ActiveRecord::Migration
  def change
    add_column :group_evals, :team_id, :int
  end
end
