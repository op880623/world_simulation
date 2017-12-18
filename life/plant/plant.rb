require_relative "../life.rb"

class Plant < Life

  @@plants = []

  def initialize(lng, lat)
    super(lng, lat)
    @@plants.push(self)
  end

  def self.count()
    return @@plants.size
  end

  def self.all()
    return @@plants
  end

  def self.get(lng, lat)
    set = []
    for plant in @@plants
       set.push(plant) if plant.lng == lng && plant.lat == lat
    end
    return set
  end

  def die()
    @@plants.delete(self)
    super()
  end

end
