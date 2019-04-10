require 'pry'
class Reunion
  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.sum do |activity|
      activity.total_cost
    end
  end

  def create_person_hash
    breakout = {}
    @activities.each do |activity|
      activity.participants.keys.each do |person|
        breakout[person] = 0
      end
    end
    breakout
  end

  def breakout
    breakout = create_person_hash
    @activities.each do |activity|
      activity.owed.each do |person, amount_owed|
        breakout[person] += amount_owed
      end
    end
    breakout
  end

  def summary
    summary = []
    breakout.each do |person, owed|
      summary << "#{person}: #{owed}"
    end
    summary.join("\n")
  end

  def detailed_breakout
    detailed_breakout = {}
    @activities.each do |activity|
      activity.participants.each do |participant|
        detailed_breakout[participant[0]] = []
      end
    end
    @activities.each do |activity|
      activity_info = {
        activity: activity.name,
        payees: activity.participants,
        amount: activity.owed
      }
      activity.participants.each do |participant|
        detailed_breakout[participant[0]] << activity_info
      end
    end
    binding.pry
  end
end
