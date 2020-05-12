class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :player_1
      t.integer :player_2
      t.integer :player_3
      t.integer :p1_score, default: 0
      t.integer :p2_score, default: 0
      t.integer :p3_score, default: 0
      t.integer :winner_id
      t.string :status, default: "incomplete"
      t.integer :dealer

      t.timestamps
    end
  end
end
