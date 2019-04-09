require './lib/activity'
require 'minitest/autorun'

class ActivityTest < Minitest::Test
  attr_reader :activity

  def setup
    @activity = Activity.new("Brunch")
  end

  def test_it_exists
    assert_instance_of Activity, activity
  end

  def test_it_has_name
    assert_equal "Brunch", activity.name
  end

  def test_it_starts_with_no_participants
    expected = {}
    assert_equal expected, activity.participants
  end

  def test_it_can_add_participants
    activity.add_participant("Maria", 20)

    expected = {"Maria" => 20}
    assert_equal expected, activity.participants
  end

  def test_it_can_get_total_amount_paid_for_all_participants
    activity.add_participant("Maria", 20)

    assert_equal 20, activity.total_cost
  end

  def test_it_can_add_more_than_one_participant
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    expected = {"Maria" => 20, "Luther" => 40}
    assert_equal expected, activity.participants
  end
end
