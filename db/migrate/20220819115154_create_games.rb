class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :game_type, null: false, foreign_key: true, index: true
      t.string :state, null: false, default: "started"

      t.timestamps
    end
  end
end
