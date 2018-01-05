require_relative "animal.rb"
require_relative "../plant/grass.rb"

class Herbivore < Animal

  @@herbivores = []

  def initialize(location)
    super(location)
    @@herbivores.push(self)
  end

  def self.count()
    return @@herbivores.size
  end

  def self.all()
    return @@herbivores
  end

  def self.get(location)
    set = []
    for herbivore in @@herbivores
       set.push(herbivore) if herbivore.location() == location
    end
    return set
  end

  def load()
    super()
    @@herbivores.push(self)
  end

  def find_food()
    food = Grass.get(self.location()).sample()
    return nil if !food
    return food if food.leaves > 0
    return nil
  end

  def die()
    @@herbivores.delete(self)
    super()
  end

end
