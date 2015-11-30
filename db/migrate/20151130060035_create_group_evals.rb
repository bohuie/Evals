class CreateGroupEvals < ActiveRecord::Migration
  def change
    create_table :group_evals do |t|
      t.string :team
      t.text :questions
      t.integer :presentation
      t.integer :answering
      t.integer :contribution
      t.text :strength
      t.text :weakness
      t.timestamps null: false
    end
  end
end
