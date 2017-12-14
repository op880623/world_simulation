class World
  attr_accessor :size

  def initialize(size)
    @size = size
  end

  def time_pass(lives)
    for life in lives
      life.move()
      if rand(5) == 0
        life.breed()
      end
    end
  end

  def show(lives)
    places = []
    (@size**2).times do |i|
      places[i] = 0
    end
    for life in lives
      place = life.x * @size + life.y
      places[place] += 1
    end

    @size.times do |x|
      print "|"
      @size.times do |y|
        print "#{places[x * @size + y]}|"
      end
      puts ""

      print "-"
      @size.times do |y|
        print "---"
      end
      puts ""
    end
    puts ""
  end

end
