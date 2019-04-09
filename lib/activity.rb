class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, amount_paid)
    @participants[name] = amount_paid
  end

  def total_cost
    @participants.values.sum
  end

  def split
    @participants.values.sum / @participants.length
  end

  def owed
    @participants.transform_values do |amount_paid|
      split - amount_paid
    end
  end
end
