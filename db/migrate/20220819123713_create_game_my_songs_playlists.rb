class CreateGameMySongsPlaylists < ActiveRecord::Migration[7.0]
  def change
    create_table :game_my_songs_playlists do |t|
      t.references :player, null: false, foreign_key: true
      t.string :track_1, null: true
      t.string :track_2, null: true
      t.string :track_3, null: true

      t.timestamps
    end
  end
end
