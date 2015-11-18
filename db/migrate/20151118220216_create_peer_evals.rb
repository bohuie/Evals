class CreatePeerEvals < ActiveRecord::Migration
  def change
    create_table :peer_evals do |t|
      t.string :milestone
      t.string :evaluatee
      t.integer :goals
      t.integer :quality
      t.integer :effort
      t.integer :considerate
      t.integer :knowledge
      t.integer :sharing
      t.string :strength
      t.string :weakness
      t.timestamps null: false
    end
  end
end
