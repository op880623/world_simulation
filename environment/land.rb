require_relative "environment.rb"

class Land < Environment

  @@lands = []

  def initialize(location)
    super(location)
    @waterMax = rand(0..10000)
    @water = @waterMax
    @@lands.push(self)
  end

  def self.count()
    return @@lands.size
  end

  def self.all()
    return @@lands
  end

  def destroy()
    super()
    @@lands.delete(self)
  end

  def water_max()
    return @waterMax
  end

  def water()
    return @water
  end

  def water_used(quantity)
    if quantity <= @water
      @water -= quantity
      return quantity
    else
      return nil
    end
  end

  def restore()
    @water = self.water_max()
  end

end
