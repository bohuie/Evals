class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :peer_evals, :student_id, :user_id
  end
end
