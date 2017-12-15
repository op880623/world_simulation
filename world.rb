class World
  attr_accessor :size

  def initialize(size)
    @size = size
  end

  def time_pass(lives)
    for life in lives
      life.live()
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

    print "+"
    @size.times do |y|
      print "--+"
    end
    puts ""
    @size.times do |x|
      print "|"
      @size.times do |y|
        num = places[x * @size + y]
        if num >= 10
          print "#{num}|"
        else
          print " #{num}|"
        end
      end
      puts ""

      print "+"
      @size.times do |y|
        print "--+"
      end
      puts ""
    end
    puts ""
  end

end
