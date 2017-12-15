# work anywhere
require_relative "life/animal.rb"
require_relative "world.rb"
# work in world/
# require "./life/animal.rb"
# require "./world.rb"
# work in world/life
# require "./animal.rb"
# require "../world.rb"

size = 8
world = World.new(size)

# make a life move around
# a = Animal.new(world, rand(size), rand(size))
# 10.times do
#   puts a.move()
#   world.show(Life.all)
# end

# make 10 lives live
10.times do
  Animal.new(world, rand(size), rand(size))
end

world.show(Life.all)

20.times do
  world.time_pass(Life.all)
end

world.show(Life.all)
puts Life.count
puts Animal.count
