class Milestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :description
      t.integer :priority
      t.timestamps null: false
    end
    change_column_default :milestones, :priority, 0

    Milestone.create description: 'Requirements'
    Milestone.create description: 'Design', priority: 1
    Milestone.create description: 'Proto 1', priority: 2
    Milestone.create description: 'Proto 2', priority: 3
    Milestone.create description: 'Proto 3', priority: 4
    Milestone.create description: 'Final', priority: 5

    rename_column :feedbacks, :milestone, :milestone_old
    rename_column :group_evals, :milestone, :milestone_old
    rename_column :peer_evals, :milestone, :milestone_old

    add_column :feedbacks, :milestone_id, :integer
    add_column :group_evals, :milestone_id, :integer
    add_column :peer_evals, :milestone_id, :integer
  end
end
