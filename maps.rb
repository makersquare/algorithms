require 'pry-debugger'

class Map
  def initialize
    @cities = {}
  end

  def get_city(name)
    @cities[name] ||= City.new(name)
  end

  def add_city(name)
    get_city(name)
  end

  def add_road(city1, city2, distance)
    c1 = get_city(city1)
    c2 = get_city(city2)
    c1.add_neighbor(c2, distance)
    c2.add_neighbor(c1, distance)
  end

  def find_path(city1, city2)
    @cities.values.each {|c| c.reset_path_vars}
    start = get_city(city1)
    finish = get_city(city2)
    start.path = 0
    cities_to_search = [get_city(city1)]

    while (cities_to_search.any?)
      current_city = find_closest_city(cities_to_search)
      puts "#{current_city.name}\t#{current_city.path}"
      if current_city == finish
        return finish.path
      end

      current_city.solved = true

      current_city.neighbors.each do |neighbor, distance|
        if !neighbor.solved &&
          (neighbor.path.nil? || neighbor.path > current_city.path + distance)
          neighbor.path = current_city.path + distance
          neighbor.parent = current_city
          unless cities_to_search.include? neighbor
            cities_to_search << neighbor
          end
        end
      end
    end
    return nil
  end

  def find_closest_city(cities)
    cities.sort! {|c1, c2| c1.path <=> c2.path}
    cities.shift
  end
end

class City
  attr_accessor :parent, :path, :solved, :neighbors, :name
  def initialize(name)
    @name = name
    @neighbors = {}
    reset_path_vars
  end

  def reset_path_vars
    @parent = nil
    @path = nil
    @solved = false
  end

  def add_neighbor(other_city, distance)
    @neighbors[other_city] = distance
  end
end