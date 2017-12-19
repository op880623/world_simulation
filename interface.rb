def get_number(question)
  print question
  input = gets.chomp
  puts ""
  return input.to_i() if /^\d+$/.match(input)
  return get_number(question)
end

def world_size()
  biggestSize = 4
  size = get_number("How big the world you want(1~#{biggestSize}):")
  return size if 0 < size && size <= biggestSize
  puts "out of range!"
  return world_size()
end

def move_to(lng, lat, size)

  def new_lng(size)
    lng = get_number("Enter lng of new location(0~#{size-1}):")
    return lng if 0 <= lng && lng < size
    puts "out of range!"
    return new_lng(size)
  end

  def new_lat(size)
    lat = get_number("Enter lat of new location(0~#{size-1}):")
    return lat if 0 <= lat && lat < size
    puts "out of range!"
    return new_lat(size)
  end

  return new_lng(size), new_lat(size)
end

def create_life(lng, lat)
  def choose_life()
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
      return Life
    when 'a'
      return Animal
    when 'p'
      return Plant
    when 'g'
      return Grass
    when 'c'
      return nil
    else
      return choose_life()
    end
  end

  if lifeType = choose_life()
    num = get_number("How many #{lifeType} you want to create?")
    num.times do
      lifeType.new(lng, lat)
    end
  end
  return nil
end

def time_pass()
  days = get_number("How many days to pass?")
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
