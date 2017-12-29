# require 'date'
require 'yaml'

def get_number(question)
  print question
  input = gets.chomp
  puts ""
  # return if input is number, or ask again
  # not handle input out of range
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

def create_world(size)
  # create a square world
  size.times do |lng|
    size.times do |lat|
      # only Land now
      Land.new([lng, lat])
    end
  end
end

def move_to(size)

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

def create_life(location)
  def choose_life()
    puts "which kind of life do you want to create?"
    puts "(l) Life"
    puts "(p) Plant"
    puts "(g) Grass"
    puts "(a) Animal"
    puts "(h) Herbivore"
    puts "(c) Cancel"
    print "pick one:"
    choise = gets.chomp
    puts ""
    case choise
    when 'l'
      return Life
    when 'a'
      return Animal
    when 'h'
      return Herbivore
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
      lifeType.new(location)
    end
  end
  return nil
end

def show_date(days)
  # count year
  year = 1
  while 365 < days
    year += 1
    days -= 365
  end
  # count month, the rest are days
  case days
  when 1..31
    month = 'Jan'
  when 32..59
    month = 'Feb'
    days -= 31
  when 60..90
    month = 'Mar'
    days -= 59
  when 91..120
    month = 'Apr'
    days -= 90
  when 121..151
    month = 'May'
    days -= 120
  when 152..181
    month = 'Jun'
    days -= 151
  when 182..212
    month = 'Jul'
    days -= 181
  when 213..243
    month = 'Aug'
    days -= 212
  when 244..273
    month = 'Sep'
    days -= 243
  when 274..304
    month = 'Oct'
    days -= 273
  when 305..334
    month = 'Nov'
    days -= 304
  when 335..365
    month = "Dec"
    days -= 334
  end
  puts "Date: #{year}-#{month}-#{days}"
end

def time_pass(size)
  days = get_number("How many days to pass?")
  # pass many days
  days.times do
    # pass one day
    for env in Environment.all
      env.restore()
    end
    for life in Life.all
      life.live(size)
    end
  end
  return days
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
    # print coordinate
    print "|"
    size.times do |lng|
      print "water max: #{Environment.get([lng, lat]).water_max}".ljust(15) + "|"
    end
    puts ""

    # print number of each life, one line per life
    for life in lives
      print "|"
      size.times do |lng|
        print "#{life}: #{life.get([lng, lat]).size}".ljust(15) + "|"
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

def save()
  # fileName = 'save/' + DateTime.now.strftime('%Y%m%d%H%M%S') + '.txt'
  fileName = 'save/save.txt'
  file = File.new(fileName, 'w')
  objects = Environment.all + Life.all
  file.puts objects.to_yaml
  file.close()
end

def load()
  fileName = 'save/save.txt'
  objects = YAML.load_file(fileName)
  for object in objects
    object.load()
  end
end
