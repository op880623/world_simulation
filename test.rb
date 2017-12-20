def test_env()
  puts "Environment test"
  load "./environment/environment.rb"
  5.times do |i|
    5.times do |j|
      Environment.new(i, j)
    end
  end
  3.times do
    Environment.new(2, 2)
  end
  puts "Environment.count() = #{Environment.count()}"
  puts "a = Environment.get(2, 2)"
  a = Environment.get(2, 2)
  puts "puts a = #{a}"
  puts "a.lng = #{a.lng}"
  puts "a.lat = #{a.lat}"
  puts "a.east() = #{a.east()}"
  puts "a.west() = #{a.west()}"
  puts "a.south() = #{a.south()}"
  puts "a.north() = #{a.north()}"
  puts "a.neighbor() = #{a.neighbor()}"

  puts "a = Environment.get(0, 0)"
  a = Environment.get(0, 0)
  puts "puts a = #{a}"

  puts "a.expand()"
  a.expand()

  puts "Environment.count() = #{Environment.count()}"

  puts "a = Environment.get(0, -1)"
  a = Environment.get(0, -1)

  puts "a.location = #{a.location}"
  puts "----------------------------------------"
end

def test_land()
  puts "Land test"
  load "./environment/land.rb"
  5.times do |i|
    5.times do |j|
      Land.new(i, j)
    end
  end
  3.times do
    Land.new(2, 2)
  end
  puts "Land.count() = #{Land.count()}"
  puts "a = Land.get(2, 2)"
  a = Land.get(2, 2)
  puts "puts a = #{a}"
  puts "a.lng = #{a.lng}"
  puts "a.lat = #{a.lat}"
  puts "a.east() = #{a.east()}"
  puts "a.west() = #{a.west()}"
  puts "a.south() = #{a.south()}"
  puts "a.north() = #{a.north()}"
  puts "a.neighbor() = #{a.neighbor()}"

  puts "a = Land.get(0, 0)"
  a = Land.get(0, 0)
  puts "puts a = #{a}"

  puts "a.expand()"
  a.expand()
  puts "Land.count() = #{Land.count()}"
  puts "a = Land.get(0, -1)"
  a = Land.get(0, -1)
  puts "a.location = #{a.location}"
  puts "----------------------------------------"
end

def test_life()
  puts "Life test"
  load "./life/life.rb"
  puts "a = Life.new(0, 0)"
  a = Life.new(0, 0)
  puts "puts a = #{a}"
  puts "a.lng = #{a.lng}"
  puts "a.lat = #{a.lat}"
  puts "breed() 10 times"
  10.times do
    a.breed()
  end
  puts "Life.count() = #{Life.count()}"
  puts "Life.get(0, 0) = #{Life.get(0, 0)}"
  for life in Life.all()
    puts "life = #{life}"
  end
  puts "----------------------------------------"
end

def test_animal()
  puts "Animal test"
  load "./life/animal/animal.rb"
  puts "a = Animal.new(0, 0)"
  a = Animal.new(0, 0)
  puts "puts a = #{a}"
  puts "a.lng = #{a.lng}"
  puts "a.lat = #{a.lat}"
  3.times do
    a.breed()
  end
  10.times do
    a.move()
    a.breed()
  end
  puts "Animal.count() = #{Animal.count()}"
  puts "Animal.get(0, 0).count() = #{Animal.get(0, 0).count()}"
  for animal in Animal.all()
    puts "animal = #{animal}"
  end
  puts "----------------------------------------"
end

def test_plant()
  puts "Plant test"
  load "./life/plant/plant.rb"
  puts "a = Plant.new(0, 0)"
  a = Plant.new(0, 0)
  puts "puts a = #{a}"
  puts "a.lng = #{a.lng}"
  puts "a.lat = #{a.lat}"
  3.times do
    a.breed()
  end
  puts "Plant.count() = #{Plant.count()}"
  puts "Plant.get(0, 0).count() = #{Plant.get(0, 0).count()}"
  for plant in Plant.all()
    puts "plant = #{plant}"
  end
  puts "----------------------------------------"
end

def test_grass()
  puts "Grass test"
  load "./life/plant/grass.rb"
  puts "a = Grass.new(0, 0)"
  a = Grass.new(0, 0)
  puts "puts a = #{a}"
  puts "a.lng = #{a.lng}"
  puts "a.lat = #{a.lat}"
  3.times do
    a.breed()
  end
  puts "Grass.count() = #{Grass.count()}"
  puts "Grass.get(0, 0).count() = #{Grass.get(0, 0).count()}"
  for grass in Grass.all()
    puts "grass = #{grass}"
  end
  puts "----------------------------------------"
end

def test_num()
  puts "test number"
  load "./life/life.rb"
  load "./life/plant/plant.rb"
  load "./life/plant/grass.rb"

  puts "Grass.new(0, 0)"
  Grass.new(0, 0)
  puts "Grass.count() = #{Grass.count()}"
  puts "Plant.count() = #{Plant.count()}"
  puts "Life.count() = #{Life.count()}"

  puts "Plant.new(0, 0)"
  Plant.new(0, 0)
  puts "Grass.count() = #{Grass.count()}"
  puts "Plant.count() = #{Plant.count()}"
  puts "Life.count() = #{Life.count()}"

  puts "Life.new(0, 0)"
  Life.new(0, 0)
  puts "Grass.count() = #{Grass.count()}"
  puts "Plant.count() = #{Plant.count()}"
  puts "Life.count() = #{Life.count()}"
  puts "----------------------------------------"
end

test_env()
test_land()
test_life()
test_animal()
test_plant()
test_grass()
test_num()
