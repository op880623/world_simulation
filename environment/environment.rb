class Environment

  @@environments = []
  @@expansion_rate = 0.5

  def initialize()
    @neighborhood = {'east': nil, 'south': nil, 'west': nil, 'north': nil}
    @@environments.push(self)
  end

  def self.count()
    return @@environments.size
  end

  def self.all()
    return @@environments
  end

  def to_s()
    str = "#{self.class}"
    for direction in @neighborhood
      str += " #{direction}: #{@neighborhood[direction]}" if @neighborhood[direction]
    end
    return str
  end

  def east()
    return @neighborhood[:east]
  end

  def south()
    return @neighborhood[:south]
  end

  def west()
    return @neighborhood[:west]
  end

  def north()
    return @neighborhood[:north]
  end

  def link(direction, neighbor = nil)
    unless neighbor.class <= Environment || neighbor.class == NilClass
      raise TypeError, "neighbor must be an Environment object"
    end
    case direction
    when :east
      self.east = neighbor
    when :south
      self.south = neighbor
    when :west
      self.west = neighbor
    when :north
      self.north = neighbor
    end
    return self
  end

  def expand(direction)
    case direction
    when :east
      if !east
        neighbor = Environment.new()
        self.link(:east, neighbor)
        neighbor.link(:west, self)
      end
    when :south
      if !south
        neighbor = Environment.new()
        self.link(:south, neighbor)
        neighbor.link(:north, self)
      end
    when :west
      if !west
        neighbor = Environment.new()
        self.link(:west, neighbor)
        neighbor.link(:east, self)
      end
    when :north
      if !north
        neighbor = Environment.new()
        self.link(:north, neighbor)
        neighbor.link(:south, self)
      end
    end
    return neighbor
  end

  private

  def east=(east)
    @neighborhood[:east] = east
  end

  def south=(south)
    @neighborhood[:south] = south
  end

  def west=(west)
    @neighborhood[:west] = west
  end

  def north=(north)
    @neighborhood[:north] = north
  end

end
