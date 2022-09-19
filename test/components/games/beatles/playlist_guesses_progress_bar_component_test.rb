require "test_helper"

class Games::Beatles::PlaylistGuessesProgressBarComponentTest < ViewComponent::TestCase
  test "render, all guessed" do
    current_player = players(:beatle_batch_81_mario)
    render_inline new_component(current_player:)
    assert_text "4 of 4 guessed"
    assert_selector '[data-test="progress-bar"]' do |element|
      assert_match "width: 100.0%", element["style"]
    end
  end

  test "render, some guessed" do
    current_player = players(:beatle_batch_81_mario)
    beatle_batch_81_mario_guessing_beatle_batch_81_yoshi_playlist.update!(guessed_player: nil)
    render_inline new_component(current_player:)
    assert_text "3 of 4 guessed"
    assert_selector '[data-test="progress-bar"]' do |element|
      assert element.matches_css?(".animate-pulse")
      assert_match "width: 75.0%", element["style"]
    end
  end

  private

  def beatle_batch_81_mario_guessing_beatle_batch_81_yoshi_playlist
    game_beatle_playlist_guesses(:beatle_batch_81_mario_guessing_beatle_batch_81_yoshi_playlist)
  end
end
