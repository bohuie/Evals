class AddStudentIdToPeerEvals < ActiveRecord::Migration
  def change
    add_column :peer_evals, :student_id, :int
  end
end
