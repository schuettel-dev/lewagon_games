class CreateGameBeatlesPlaylists < ActiveRecord::Migration[7.0]
  def change
    create_table :game_beatles_playlists do |t|
      t.references :player, null: false, foreign_key: true
      t.string :track_1_url, null: true
      t.string :track_2_url, null: true
      t.string :track_3_url, null: true

      t.timestamps
    end
  end
end
