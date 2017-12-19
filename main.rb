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
lng = 0
lat = 0

while true
  puts "".ljust(100, '-')
  puts "The situation of the world:"
  show(lives, size)
  puts "Your location: lng = #{lng}, lat = #{lat}"
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
    lng, lat = move_to(lng, lat, size)
  when 'c'
    create_life(lng, lat)
  when 't'
    time_pass()
  when 'q'
    puts "The world has been destroyed.\nCruel God!"
    break
  end
end
