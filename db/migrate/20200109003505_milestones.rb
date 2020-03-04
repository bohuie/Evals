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

    add_column :feedbacks, :milestone_id, :integer, :null => true
    add_column :group_evals, :milestone_id, :integer, :null => true
    add_column :peer_evals, :milestone_id, :integer, :null => true

    add_foreign_key :feedbacks, :milestones, :null => true
    add_foreign_key :group_evals, :milestones, :null => true
    add_foreign_key :peer_evals, :milestones, :null => true

    execute <<-SQL
      UPDATE feedbacks set milestone_id = (select id from milestones where description = 'Requirements') where milestone_old = 'Requirements';
      UPDATE feedbacks set milestone_id = (select id from milestones where description = 'Design') where milestone_old = 'Design';
      UPDATE feedbacks set milestone_id = (select id from milestones where description = 'Proto 1') where milestone_old = 'Final';
    SQL

    execute <<-SQL
      UPDATE group_evals set milestone_id = (select id from milestones where description = 'Requirements') where milestone_old = 'Requirements';
      UPDATE group_evals set milestone_id = (select id from milestones where description = 'Design') where milestone_old = 'Design';
      UPDATE group_evals set milestone_id = (select id from milestones where description = 'Proto 1') where milestone_old = 'Final';
    SQL

    execute <<-SQL
      UPDATE peer_evals set milestone_id = (select id from milestones where description = 'Requirements') where milestone_old = 'Requirements';
      UPDATE peer_evals set milestone_id = (select id from milestones where description = 'Design') where milestone_old = 'Design';
      UPDATE peer_evals set milestone_id = (select id from milestones where description = 'Proto 1') where milestone_old = 'Final';
    SQL

    change_column_null :feedbacks, :milestone_id, false
    change_column_null :group_evals, :milestone_id, false
    change_column_null :peer_evals, :milestone_id, false

  end
end
