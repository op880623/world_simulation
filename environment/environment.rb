class Environment

  @@environments = []

  def initialize(location)
    Environment.get(location).destroy() if Environment.get(location)
    lng, lat = location
    self.lng = lng
    self.lat = lat
    @@environments.push(self)
  end

  def self.count()
    return @@environments.size
  end

  def self.all()
    return @@environments
  end

  def self.get(location)
    for env in @@environments
      return env if env.location() == location
    end
    return nil
  end

  def destroy()
    @@environments.delete(self)
  end

  def to_s()
    return "<#{self.class} - lng: #{@lng}, lat: #{@lat}>"
  end

  def lng()
    return @lng
  end

  def lat()
    return @lat
  end

  def location()
    return self.lng(), self.lat()
  end

  def east()
    return Environment.get([@lng+1, @lat])
  end

  def west()
    return Environment.get([@lng-1, @lat])
  end

  def south()
    return Environment.get([@lng, @lat-1])
  end

  def north()
    return Environment.get([@lng, @lat+1])
  end

  def neighbor()
    environments = []
    environments.push(self.east()) if self.east()
    environments.push(self.west()) if self.west()
    environments.push(self.south()) if self.south()
    environments.push(self.north()) if self.north()
  end

  def expand()
    self.class.new([@lng+1, @lat]) if !self.east
    self.class.new([@lng-1, @lat]) if !self.west
    self.class.new([@lng, @lat-1]) if !self.south
    self.class.new([@lng, @lat+1]) if !self.north
  end

  def restore()
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
