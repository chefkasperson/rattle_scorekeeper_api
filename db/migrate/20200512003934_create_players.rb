class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :games
      t.integer :wins
      t.integer :sets
      t.integer :win_percentage

      t.timestamps
    end
  end
end
