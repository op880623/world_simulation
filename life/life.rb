class Life

  @@lives = []
  @@fertility_rate = 0.125
  @@mortality_rate = 0.08

  def initialize(location)
    lng, lat = location
    self.lng = lng
    self.lat = lat
    @@lives.push(self)
  end

  def self.count()
    return @@lives.size
  end

  def self.all()
    return @@lives
  end

  def self.get(location)
    set = []
    for life in @@lives
       set.push(life) if life.location() == location
    end
    return set
  end

  def to_s()
    return "<#{self.class} at lng: #{@lng}, lat: #{@lat}>"
  end

  def lng()
    return @lng
  end

  def lat()
    return @lat
  end

  def location()
    return lng, lat
  end

  def place()
    return Environment.get(self.location())
  end

  def get_way(size)
    east = [self.lng() + 1, size - 1].min()
    west = [self.lng() - 1, 0].max()
    north = [self.lat() + 1, size - 1].min()
    south = [self.lat() - 1, 0].max()
    location = [rand(west..east), rand(south..north)]
    while self.location() == location
      location = [rand(west..east), rand(south..north)]
    end
    return location
  end

  def breed?()
    return rand(100) / 100.0 < @@fertility_rate
  end

  def breed(size)
    self.class.new(self.location())
  end

  def die?()
    return rand(100) / 100.0 < @@mortality_rate
  end

  def die()
    @@lives.delete(self)
  end

  def live(size)
    self.breed(size) if self.breed?
    self.die() if self.die?
  end

  private

  def lng=(lng)
    if -180 < lng && lng < 180
      @lng = lng
    else
      raise RangeError, "longitude must be between -180 ~ 180"
    end
  end

  def lat=(lat)
    if -90 < lat && lat < 90
      @lat = lat
    else
      raise RangeError, "latitude must be between -90 ~ 90"
    end
  end
end
