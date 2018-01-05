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
    return food && food.leaves > 0 ? food : nil
  end

  def eat()
    while self.hungry? && food = self.find_food()
      @appetite += food.be_eaten(@@appetiteMax * 0.1)
    end
  end

  def die()
    @@herbivores.delete(self)
    super()
  end

end
