require_relative "life.rb"

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

  def move()
    # self.x = rand(@x-1..@x+1)
    # self.y = rand(@y-1..@y+1)
    # return "#{@x}, #{@y}"
  end
end
