require_relative "interface.rb"
require_relative "environment/environment.rb"
require_relative "environment/land.rb"
require_relative "life/life.rb"
require_relative "life/animal/animal.rb"
require_relative "life/plant/plant.rb"
require_relative "life/plant/grass.rb"


# initialize
print "Create a world?(y/N)"
choise = gets.chomp
puts ""
return nil if choise != 'y'

lives = [Life, Animal, Plant, Grass]
size = world_size()
create_world(size)
location = [0, 0]
days = 1

while true
  puts "".ljust(100, '-')
  puts "The situation of the world:"
  show(lives, size)
  show_date(days)
  puts "Your location: lng = #{location[0]}, lat = #{location[1]}"
  puts "Actions list:"
  puts "(m) Move"
  puts "(c) Create life"
  puts "(t) Time pass"
  puts "(q) Quit"
  print "Your choise:"
  choise = gets.chomp
  puts ""
  case choise
  when 'm'
    location = move_to(location, size)
  when 'c'
    create_life(location)
  when 't'
    days += time_pass(size)
  when 'q'
    puts "The world has been destroyed.\nCruel God!"
    break
  end
end
