require "test_helper"

class BatchTest < ActiveSupport::TestCase
  test "validations" do
    batch = Batch.new
    assert_not batch.valid?

    batch.errors.to_a.tap do |errors|
      assert_includes errors, "Name can't be blank"
      assert_includes errors, "Location can't be blank"
      assert_includes errors, "Owner can't be blank"
    end
  end

  test "#owner=, new record" do
    owner = users(:luigi)
    batch = Batch.new(name: "Batch X", location: "Somewhere")
    batch.owner = owner
    assert batch.save
    assert_equal owner, batch.owner
  end
end
