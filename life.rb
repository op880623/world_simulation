class Life

  @@lives = []

  def initialize(world, x, y)
    @world = world
    @x = x
    @y = y
    @@lives.push(self)
  end

  def self.count()
    return @@lives.size
  end

  def self.all()
    return @@lives
  end

  def x()
    return @x
  end

  def x=(num)
    if num >= @world.size
      self.x = num - @world.size
    elsif num < 0
      self.x = num + @world.size
    else
      @x = num
    end
  end

  def y()
    return @y
  end

  def y=(num)
    if num >= @world.size
      self.y = num - @world.size
    elsif num < 0
      self.y = num + @world.size
    else
      @y = num
    end
  end

  def breed()
    child = self.class.new(@world, @x, @y)
  end

  def move()
    self.x = rand(@x-1..@x+1)
    self.y = rand(@y-1..@y+1)
    return "#{@x}, #{@y}"
  end
end
