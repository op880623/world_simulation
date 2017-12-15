require_relative "../life.rb"

class Animal < Life

  @@animals = []

  def initialize(lng, lat)
    super(lng, lat)
    @@animals.push(self)
  end

  def self.count()
    return @@animals.size
  end

  def self.all()
    return @@animals
  end

  def self.get(lng, lat)
    set = []
    for animal in @@animals
       set.push(animal) if animal.lng == lng && animal.lat == lat
    end
    return set
  end

  def move()
    self.lng = rand(lng-1..lng+1)
    self.lat = rand(lat-1..lat+1)
  end
end
