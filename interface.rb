def world_size()
  biggestSize = 4
  print "How big the world you want(1~#{biggestSize}):"
  size = gets.chomp.to_i()
  puts ""
  if 0 < size && size <= biggestSize
    return size
  else
    return nil
  end
end

def move(lng, lat, size)
  puts "Move..."
  puts "(u) Up"
  puts "(d) Down"
  puts "(l) Left"
  puts "(r) Right"
  puts "(c) Cancel"
  print "where?"
  choise = gets.chomp
  puts ""
  case choise
  when 'u'
    lat += 1 if lat + 1 < size
  when 'd'
    lat -= 1 if 0 <= lat - 1
  when 'l'
    lng -= 1 if 0 <= lng - 1
  when 'r'
    lng += 1 if lng + 1 < size
  when 'c'
  else
    lng, lat = move(lng, lat, size)
  end
  return lng, lat
end

def create_life(lng, lat)
  puts "which kind of life do you want to create?"
  puts "(l) Life"
  puts "(a) Animal"
  puts "(p) Plant"
  puts "(g) Grass"
  puts "(c) Cancel"
  print "pick one:"
  choise = gets.chomp
  puts ""
  case choise
  when 'l'
    Life.new(lng, lat)
  when 'a'
    Animal.new(lng, lat)
  when 'p'
    Plant.new(lng, lat)
  when 'g'
    Grass.new(lng, lat)
  when 'c'
  else
    create_life(lng, lat)
  end
end

def time_pass()
  print "How many days to pass?"
  days = gets.chomp.to_i()
  days.times do
    for life in Life.all
      life.live()
    end
  end
end

def show(lives, size)
  print "+"
  size.times do
    print "+".rjust(16, '-')
  end
  puts ""

  size.times do |lat|
    lat = size - lat - 1

    # print coordinate
    print "|"
    size.times do |lng|
      print "lng: #{lng}, lat: #{lat}".ljust(15) + "|"
    end
    puts ""

    # print number of each life, one line per life
    for life in lives
      print "|"
      size.times do |lng|
        print "#{life}: #{life.get(lng, lat).size}".ljust(15) + "|"
      end
      puts ""
    end

    print "+"
    size.times do
      print "+".rjust(16, '-')
    end
    puts ""
  end
  puts ""
end
