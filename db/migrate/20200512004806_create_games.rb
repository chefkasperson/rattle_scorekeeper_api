class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :player_1
      t.integer :player_2
      t.integer :player_3
      t.integer :p1_score
      t.integer :p2_score
      t.integer :p3_score
      t.integer :winner_id
      t.string :status
      t.integer :dealer

      t.timestamps
    end
  end
end
