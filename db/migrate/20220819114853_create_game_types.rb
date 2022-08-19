class CreateGameTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :game_types do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :klass, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
