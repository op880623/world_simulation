def test_env(size)
  puts "Environment test"
  load "./environment/environment.rb"
  5.times do |i|
    5.times do |j|
      Environment.new([i, j])
    end
  end
  3.times do
    Environment.new([2, 2])
  end
  puts "Environment.count() = #{Environment.count()}"
  puts "a = Environment.get([2, 2])"
  a = Environment.get([2, 2])
  puts "puts a = #{a}"
  puts "a.lng = #{a.lng}"
  puts "a.lat = #{a.lat}"
  puts "a.location = #{a.location}"
  puts "a.east() = #{a.east()}"
  puts "a.west() = #{a.west()}"
  puts "a.south() = #{a.south()}"
  puts "a.north() = #{a.north()}"
  puts "a.neighbor() = #{a.neighbor()}"

  puts "a = Environment.get([0, 0])"
  a = Environment.get([0, 0])
  puts "puts a = #{a}"

  puts "a.expand()"
  a.expand()

  puts "Environment.count() = #{Environment.count()}"

  puts "a = Environment.get([0, -1])"
  a = Environment.get([0, -1])

  puts "Environment.get([0, -1]) = #{Environment.get([0, -1])}"
  puts "Environment.get([0, -2]) = #{Environment.get([0, -2])}"

  puts "a.destroy()"
  a.destroy()
  puts "Environment.count() = #{Environment.count()}"
  puts "----------------------------------------"
end

def test_land(size)
  puts "Land test"
  load "./environment/land.rb"
  3.times do
    Land.new([2, 2])
  end
  puts "Environment.count() = #{Environment.count()}"
  puts "Land.count() = #{Land.count()}"
  puts "a = Environment.get([2, 2])"
  a = Environment.get([2, 2])
  puts "puts a = #{a}"
  puts "puts a.class = #{a.class}"
  puts "a.water_max() = #{a.water_max()}"
  puts "a.water() = #{a.water()}"
  puts "a.water_used(10) = #{a.water_used(10)}"
  puts "a.water() = #{a.water()}"
  puts "a.water_used(10000) = #{a.water_used(10000)}"
  puts "a.water() = #{a.water()}"
  puts "a.restore()"
  a.restore()
  puts "a.water() = #{a.water()}"
  puts "a.destroy()"
  a.destroy()
  puts "Environment.count() = #{Environment.count()}"
  puts "Land.count() = #{Land.count()}"
  puts "----------------------------------------"
end

def test_life(size)
  puts "Life test"
  load "./life/life.rb"
  puts "a = Life.new([0, 0])"
  a = Life.new([0, 0])
  puts "puts a = #{a}"
  puts "a.lng = #{a.lng}"
  puts "a.lat = #{a.lat}"
  puts "a.location = #{a.location}"
  puts "breed(size) 10 times"
  10.times do
    a.breed(size)
  end
  puts "Life.count() = #{Life.count()}"
  puts "Life.get([0, 0]) = #{Life.get([0, 0])}"
  for life in Life.all()
    puts "life = #{life}"
  end
  puts "----------------------------------------"
end

def test_animal(size)
  puts "Animal test"
  load "./life/animal/animal.rb"
  puts "a = Animal.new([0, 0])"
  a = Animal.new([0, 0])
  puts "puts a = #{a}"
  puts "a.lng = #{a.lng}"
  puts "a.lat = #{a.lat}"
  3.times do
    a.breed(size)
  end
  10.times do
    a.move(size)
    a.breed(size)
  end
  puts "Animal.count() = #{Animal.count()}"
  puts "Animal.get([0, 0]).count() = #{Animal.get([0, 0]).count()}"
  for animal in Animal.all()
    puts "animal = #{animal}"
  end
  puts "----------------------------------------"
end

def test_herbivore(size)
  puts "Herbivore test"
  load "./life/animal/herbivore.rb"
  puts "a = Herbivore.new([0, 0])"
  a = Herbivore.new([0, 0])
  puts "puts a = #{a}"
  puts "a.lng = #{a.lng}"
  puts "a.lat = #{a.lat}"
  3.times do
    a.breed(size)
  end
  10.times do
    a.move(size)
    a.breed(size)
  end
  puts "Animal.count() = #{Animal.count()}"
  puts "Herbivore.count() = #{Herbivore.count()}"
  puts "Herbivore.get([0, 0]).count() = #{Herbivore.get([0, 0]).count()}"
  # for herbivore in Herbivore.all()
  #   puts "herbivore = #{herbivore}"
  # end
  load "./life/plant/grass.rb"
  3.times do
    Grass.new(a.location())
  end
  3.times do
    food = a.find_food()
    puts "a.find_food() = #{food}"
  end
  puts "----------------------------------------"
end

def test_plant(size)
  puts "Plant test"
  load "./environment/land.rb"
  load "./life/plant/plant.rb"
  puts "size = #{size}"
  puts "l = Land.new([0, 0])"
  l = Land.new([0, 0])
  puts "l.water_max() = #{l.water_max()}"
  puts "a = Plant.new([0, 0])"
  a = Plant.new([0, 0])
  puts "puts a = #{a}"
  puts "a.lng = #{a.lng}"
  puts "a.lat = #{a.lat}"
  puts "a.location = #{a.location}"
  puts "a.leaves() = #{a.leaves()}"
  3.times do
    a.live(size)
    puts "a.leaves() = #{a.leaves()}"
  end
  puts "Plant.count() = #{Plant.count()}"
  puts "a.crowded? = #{a.crowded?}"
  80.times do
    a.breed(size)
  end
  puts "Plant.count() = #{Plant.count()}"
  puts "a.crowded? = #{a.crowded?}"
  puts "Plant.get([0, 0]).count() = #{Plant.get([0, 0]).count()}"
  puts "----------------------------------------"
end

def test_grass(size)
  puts "Grass test"
  load "./environment/land.rb"
  load "./life/plant/grass.rb"
  puts "size = #{size}"
  puts "l = Land.new([0, 0])"
  l = Land.new([0, 0])
  puts "l.water_max() = #{l.water_max()}"
  puts "a = Grass.new([0, 0])"
  a = Grass.new([0, 0])
  puts "puts a = #{a}"
  puts "a.lng = #{a.lng}"
  puts "a.lat = #{a.lat}"
  puts "a.location = #{a.location}"
  3.times do
    a.breed(size)
  end
  puts "Grass.count() = #{Grass.count()}"
  puts "a.crowded? = #{a.crowded?}"
  80.times do
    a.breed(size)
  end
  puts "Grass.count() = #{Grass.count()}"
  puts "a.crowded? = #{a.crowded?}"
  puts "Grass.get([0, 0]).count() = #{Grass.get([0, 0]).count()}"
  puts "----------------------------------------"
end

def test_num(size)
  puts "test number"
  load "./life/life.rb"
  load "./life/plant/plant.rb"
  load "./life/plant/grass.rb"

  puts "Grass.new(0, 0)"
  Grass.new([0, 0])
  puts "Grass.count() = #{Grass.count()}"
  puts "Plant.count() = #{Plant.count()}"
  puts "Life.count() = #{Life.count()}"

  puts "Plant.new(0, 0)"
  Plant.new([0, 0])
  puts "Grass.count() = #{Grass.count()}"
  puts "Plant.count() = #{Plant.count()}"
  puts "Life.count() = #{Life.count()}"

  puts "Life.new(0, 0)"
  Life.new([0, 0])
  puts "Grass.count() = #{Grass.count()}"
  puts "Plant.count() = #{Plant.count()}"
  puts "Life.count() = #{Life.count()}"
  puts "----------------------------------------"
end

def test_load()
  require 'yaml'
  require_relative "interface.rb"
  require_relative "environment/environment.rb"
  require_relative "environment/land.rb"
  require_relative "life/life.rb"
  require_relative "life/plant/plant.rb"
  require_relative "life/plant/grass.rb"
  require_relative "life/animal/animal.rb"
  require_relative "life/animal/herbivore.rb"
  fileName = 'save/save.txt'
  world = YAML.load_file(fileName)
  puts "size: #{world[:size]}"
  puts "days: #{world[:days]}"
  puts "how many objects: #{world[:objects].size}"
end

size = 3
test_env(size)
test_land(size)
test_life(size)
test_animal(size)
test_herbivore(size)
test_plant(size)
test_grass(size)
test_num(size)
test_load()
