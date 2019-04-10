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

  def breakout
    breakout = {}
    @activities.each do |activity|
      activity.participants.keys.each do |person|
        breakout[person] = 0
      end
    end
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
end
