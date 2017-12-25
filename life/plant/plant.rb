require_relative "../life.rb"

class Plant < Life

  @@plants = []
  @@leavesMax = 100

  def initialize(location)
    super(location)
    @leaves = @@leavesMax
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

  def leaves()
    return @leaves
  end

  def healthy?()
    return self.leaves >= @@leavesMax * 0.9 || false
  end

  def grow()
    while self.place().water_used(10) && !self.healthy?
      @leaves += 5
    end
  end

  def be_eaten()
    if 10 <= @leaves
      @leaves -= 10
      return 10
    else
      self.die()
      return @leaves
    end
  end

  def crowded?()
    return true if self.place().water_max() / 100 < self.class.get(self.location()).size
    return false
  end

  def breed(size)
    return nil if !self.healthy? || !self.place().water_used(200)
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

  def live(size)
    if !self.place().water_used(self.leaves/2)
      self.die()
      return nil
    end
    self.grow()
    super(size)
  end

end
