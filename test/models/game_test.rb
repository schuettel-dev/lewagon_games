require "test_helper"

class GameTest < ActiveSupport::TestCase
  test "validations" do
    game = Game.new
    assert_not game.valid?
    game.errors.to_a.tap do |errors|
      assert_includes errors, "Game type must exist"
      assert_includes errors, "Batch must exist"
      assert_includes errors, "User must exist"
    end
  end
end
