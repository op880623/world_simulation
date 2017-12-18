require_relative "plant.rb"

class Grass < Plant

  @@grass = []

  def initialize(lng, lat)
    super(lng, lat)
    @@grass.push(self)
  end

  def self.count()
    return @@grass.size
  end

  def self.all()
    return @@grass
  end

  def self.get(lng, lat)
    set = []
    for grass in @@grass
       set.push(grass) if grass.lng == lng && grass.lat == lat
    end
    return set
  end

  def die()
    @@grass.delete(self)
    super()
  end

end
