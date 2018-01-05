require_relative "interface.rb"
require_relative "environment/environment.rb"
require_relative "environment/land.rb"
require_relative "life/life.rb"
require_relative "life/plant/plant.rb"
require_relative "life/plant/grass.rb"
require_relative "life/animal/animal.rb"
require_relative "life/animal/herbivore.rb"


# initialize
if File.exists?('save/save.txt') && get_choise("There is already a world. Load it?(y/N)") == 'y'
  size, days = load()
else
  return nil if get_choise("Create a world?(y/N)") != 'y'
  size = world_size()
  create_world(size)
  days = 1
end
lives = [Life, Plant, Grass, Animal, Herbivore]
location = [0, 0]

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
  puts "(s) Save"
  puts "(l) Load"
  puts "(q) Quit"
  choise = get_choise("Your choise:")
  case choise
  when 'm'
    location = move_to(size)
  when 'c'
    create_life(location)
  when 't'
    days += time_pass(size)
  when 's'
    save(size, days)
  when 'l'
    size, days = load()
  when 'q'
    puts "The world has been destroyed.\nCruel God!"
    break
  end
end
