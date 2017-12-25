require_relative "../life.rb"

class Plant < Life

  @@plants = []

  def initialize(location)
    super(location)
    @@plants.push(self)
  end

  def self.count()
    return @@plants.size
  end

  def self.all()
    return @@plants
  end

  def self.get(location)
    set = []
    for plant in @@plants
       set.push(plant) if plant.location() == location
    end
    return set
  end

  def crowded?()
    return true if self.place().water_max() / 100 < self.class.get(self.location()).size
    return false
  end

  def breed(size)
    if self.crowded?
      self.class.new(self.get_way(size))
    else
      self.class.new(self.location())
    end
  end

  def die()
    @@plants.delete(self)
    super()
  end

end
