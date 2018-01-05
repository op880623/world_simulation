require_relative "animal.rb"
require_relative "herbivore.rb"

class Carnivore < Animal

  @@carnivores = []

  def initialize(location)
    super(location)
    @@carnivores.push(self)
  end

  def self.count()
    return @@carnivores.size
  end

  def self.all()
    return @@carnivores
  end

  def self.get(location)
    set = []
    for carnivore in @@carnivores
       set.push(carnivore) if carnivore.location() == location
    end
    return set
  end

  def load()
    super()
    @@carnivores.push(self)
  end

  def find_food()
    food = Herbivore.get(self.location()).sample()
    return food && rand(@@appetiteMax) < @appetite ? food : nil
  end

  def digest()
    @appetite -= 3
  end

  def eat()
    while self.hungry? && food = self.find_food()
      @appetite += food.be_eaten(@@appetiteMax - @appetite)
    end
  end

  def die()
    @@carnivores.delete(self)
    super()
  end

end
