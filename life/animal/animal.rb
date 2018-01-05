require_relative "../life.rb"

class Animal < Life

  @@animals = []
  @@appetiteMax = 10

  def initialize(location)
    super(location)
    @appetite = @@appetiteMax
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

  def load()
    super()
    @@animals.push(self)
  end

  def move(size)
    east = [self.lng() + 1, size - 1].min()
    west = [self.lng() - 1, 0].max()
    north = [self.lat() + 1, size - 1].min()
    south = [self.lat() - 1, 0].max()
    location = [rand(west..east), rand(south..north)]
    while self.location() == location
      location = [rand(west..east), rand(south..north)]
    end
    self.lng, self.lat = location
  end

  def starved?()
    return true if @appetite < @@appetiteMax * 0.1
    return false
  end

  def hungry?()
    return true if @appetite < @@appetiteMax * 0.9
    return false
  end

  def find_food()
    return nil
  end

  def digest()
    @appetite = 0
  end

  def be_eaten(appetite)
    self.die()
    return appetite
  end

  def live(size)
    self.digest()
    3.times do
      self.eat()
      break if !self.hungry?
      self.move(size)
    end
    self.breed(size) if self.breed? && !self.hungry?
    self.die() if self.starved?
  end

  def die()
    @@animals.delete(self)
    super()
  end

end
