require './lib/activity'
require './lib/reunion'
require 'minitest/autorun'

class ReunionTest < Minitest::Test
  attr_reader :reunion

  def setup
    @reunion = Reunion.new("1406 BE")
  end

  def test_it_exists
    assert_instance_of Reunion, reunion
  end

  def test_it_has_name
    assert_equal "1406 BE", reunion.name
  end

  def test_it_starts_with_no_activities
    assert_equal [], reunion.activities
  end

  def test_it_can_add_activities
    activity_1 = Activity.new("Brunch")

    reunion.add_activity(activity_1)

    assert_equal [activity_1], reunion.activities
  end
end
