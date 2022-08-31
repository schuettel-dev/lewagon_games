class CreateGameBeatlePlaylistGuesses < ActiveRecord::Migration[7.0]
  def change
    create_table :game_beatle_playlist_guesses do |t|
      t.references :guessing_player, null: false, foreign_key: { to_table: :players }
      t.references :guessed_game_beatle_playlist, null: false, foreign_key: { to_table: :game_beatle_playlists }, index: { name: :indx_guess_to_playlist }
      t.references :guessed_player, null: true, foreign_key: { to_table: :players }
      t.integer :sort_position, null: false
      t.integer :points, null: true

      t.timestamps
    end
  end
end
