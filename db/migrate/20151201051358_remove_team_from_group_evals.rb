class RemoveTeamFromGroupEvals < ActiveRecord::Migration
  def change
    remove_column :group_evals, :team, :string
  end
end
