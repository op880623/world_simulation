class Life

  @@lives = []
  @@fertility_rate = 0.125
  @@mortality_rate = 0.08

  def initialize(lng, lat)
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

  def self.get(lng, lat)
    set = []
    for life in @@lives
       set.push(life) if life.lng == lng && life.lat == lat
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

  def breed?()
    return rand(100) / 100.0 < @@fertility_rate
  end

  def breed()
    self.class.new(@lng, @lat)
  end

  def die?()
    return rand(100) / 100.0 < @@mortality_rate
  end

  def die()
    @@lives.delete(self)
  end

  def live()
    self.breed() if self.breed?
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
