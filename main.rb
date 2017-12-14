require "./life.rb"
require "./world.rb"

size = 5
world = World.new(size)


a = Life.new(world, rand(size), rand(size))
10.times do
  puts a.move()
  world.show(Life.all)
end

# 10.times do
#   Life.new(world, rand(size), rand(size))
# end
#
# world.show(Life.all)
#
# 20.times do
#   world.time_pass(Life.all)
# end
#
# world.show(Life.all)
