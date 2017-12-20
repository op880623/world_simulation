require_relative "plant.rb"

class Grass < Plant

  @@grass = []

  def initialize(location)
    super(location)
    @@grass.push(self)
  end

  def self.count()
    return @@grass.size
  end

  def self.all()
    return @@grass
  end

  def self.get(location)
    set = []
    for grass in @@grass
       set.push(grass) if grass.location() == location
    end
    return set
  end

  def die()
    @@grass.delete(self)
    super()
  end

end
