class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :company
      t.integer :creator_id
      t.integer :team_id
      t.string :milestone
      t.integer :q1
      t.integer :q2
      t.integer :q3
      t.integer :q4
      t.integer :q5
      t.integer :q6
      t.integer :q7
      t.integer :q8
      t.integer :q9
      t.integer :q10
      t.integer :q11
      t.text :oeq1
      t.text :oeq2
      t.text :oeq3
      t.timestamps null: false
    end
  end
end
