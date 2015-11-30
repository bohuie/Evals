class AddDetailsToGroupEvals < ActiveRecord::Migration
  def change
    add_column :group_evals, :creator_id, :int
    add_column :group_evals, :milestone, :string
  end
end
