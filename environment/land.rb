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
    if 0 < quantity && quantity <= @water
      @water -= quantity
      return quantity
    elsif quantity <= 0
      return 0
    else
      return nil
    end
  end

  def restore()
    @water = self.water_max()
  end

end
