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
    print "+"
    @size.times do
      print "+".rjust(16, '-')
    end
    puts ""

    @size.times do |lat|
      lat = size - lat - 1

      # print coordinate
      print "|"
      @size.times do |lng|
        print "lng: #{lng}, lat: #{lat}".ljust(15) + "|"
      end
      puts ""

      # print number of each life, one line per life
      for life in lives
        print "|"
        @size.times do |lng|
          print "#{life}: #{life.get(lng, lat).size}".ljust(15) + "|"
        end
        puts ""
      end

      print "+"
      @size.times do
        print "+".rjust(16, '-')
      end
      puts ""
    end
    puts ""
  end

end
