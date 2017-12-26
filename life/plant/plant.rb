require_relative "../life.rb"

class Plant < Life

  @@plants = []
  @@leavesMax = 100

  def initialize(location)
    super(location)
    self.leaves = @@leavesMax
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
      self.leaves += 5
    end
  end

  def be_eaten(appetite)
    if appetite <= self.leaves
      self.leaves -= appetite
      return appetite
    else
      self.die()
      return self.leaves
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
    until self.place().water_used(self.leaves/2)
      self.leaves -= 10
      return nil if self.leaves <= 0
    end
    self.grow()
    super(size)
  end

  private

  def leaves=(leaves)
    @leaves = leaves
    self.die() if @leaves <= 0
  end

end
