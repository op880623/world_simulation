class Environment

  @@environments = []
  @@expansion_rate = 0.5

  def initialize(lng, lat)
    @@environments.delete(Environment.get(lng, lat))
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

  def self.get(lng, lat)
    for env in @@environments
      return env if env.lng == lng && env.lat == lat
    end
    return nil
  end

  def to_s()
    str = "<#{self.class} - lng: #{@lng}, lat: #{@lat}>"
    return str
  end

  def lng()
    return @lng
  end

  def lat()
    return @lat
  end

  def east()
    return Environment.get(@lng+1, @lat)
  end

  def west()
    return Environment.get(@lng-1, @lat)
  end

  def south()
    return Environment.get(@lng, @lat-1)
  end

  def north()
    return Environment.get(@lng, @lat+1)
  end

  def expand()
    Environment.new(@lng+1, @lat) if !self.east
    Environment.new(@lng-1, @lat) if !self.west
    Environment.new(@lng, @lat-1) if !self.south
    Environment.new(@lng, @lat+1) if !self.north
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
