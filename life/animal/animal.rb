require_relative "../life.rb"

class Animal < Life

  @@animals = []

  def initialize(location)
    super(location)
    @@animals.push(self)
  end

  def self.count()
    return @@animals.size
  end

  def self.all()
    return @@animals
  end

  def self.get(location)
    set = []
    for animal in @@animals
       set.push(animal) if animal.location() == location
    end
    return set
  end

  def move()
    self.lng = rand(lng-1..lng+1)
    self.lat = rand(lat-1..lat+1)
  end

  def die()
    @@animals.delete(self)
    super()
  end

end
