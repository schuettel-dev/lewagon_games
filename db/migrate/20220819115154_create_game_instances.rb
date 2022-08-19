class CreateGameInstances < ActiveRecord::Migration[7.0]
  def change
    create_table :game_instances do |t|
      t.references :game, null: false, foreign_key: true, index: true
      t.string :state, null: false, default: "started"

      t.timestamps
    end
  end
end
