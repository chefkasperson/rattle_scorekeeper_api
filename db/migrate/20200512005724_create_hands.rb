class CreateHands < ActiveRecord::Migration[6.0]
  def change
    create_table :hands do |t|
      t.string :p1_score
      t.string :p2_score
      t.string :p3_score
      t.string :bid
      t.belongs_to :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
