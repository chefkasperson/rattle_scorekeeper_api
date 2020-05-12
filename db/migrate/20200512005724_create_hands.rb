class CreateHands < ActiveRecord::Migration[6.0]
  def change
    create_table :hands do |t|
      t.string :p1_score
      t.string :p2_score
      t.string :p3_score
      t.string :bid
      t.string :trump
      t.integer :bidder_id
      t.string :p1_status
      t.string :p2_status
      t.string :p3_status
      t.belongs_to :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
