require_relative "animal.rb"

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

  def find_food()
    return Grass.get(self.location()).sample()
  end

  def die()
    @@herbivores.delete(self)
    super()
  end

end
