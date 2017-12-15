require_relative "../environment/environment.rb"

class Life

  @@lives = []
  @@fertility_rate = 0.125
  @@mortality_rate = 0.08

  def initialize(location)
    if location.class == Environment
      @location = location
    else
      raise TypeError, "location must be an Environment object"
    end
    @@lives.push(self)
  end

  def to_s()
    return "#{self.class} at #{@location}"
  end

  def self.count()
    return @@lives.size
  end

  def self.all()
    return @@lives
  end

  def breed()
    self.class.new(@location) if rand(100) / 100.0 < @@fertility_rate
  end

  def die()
    @@lives.delete(self) if rand(100) / 100.0 < @@mortality_rate
  end

  def live()
    self.breed()
    self.die()
  end
end
