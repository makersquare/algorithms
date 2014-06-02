require 'unirest'
require 'pry-debugger'
require_relative 'priority_queue.rb'

class Node
  attr_accessor :movie_ids, :connections
  attr_reader :name, :id, :weight

  def initialize(name, id, weight)
    @name = name
    @id = id
    @connections = Hash.new(false)
    @movie_ids = []
    @weight = weight
  end
end

class ActorSearcher
  attr_reader :nodes, :queue

  def initialize()
    @nodes = {}
    @queue = PriorityQueue.new
    @searched = Hash.new(false)
    @counter = 0
  end

  def add_actor(actor_id, weight)
    actor = grab_actor(actor_id)
    add_node(actor['name'], actor['id'], actor['movies'], weight)
  end

  def add_node(name, id, movies, weight)
    unless @nodes[id]
      node = Node.new(name, id, weight)
      movies.each do |movie|
        node.movie_ids << movie['id']
      end
      @nodes[id] = node
      node
    else
      @nodes[id]
    end
  end

  def find_connections(id)
    node = @nodes[id]
    binding.pry unless node
    node.movie_ids.each do |movie_id|
      actors = grab_actors_for_movie(movie_id)
      actors.each do |actor|
        connect_actors(node, add_actor(actor['id'], node.weight + 1))
      end
    end
  end

  def connect_actors(node1, node2)
    weight = node1.weight + 1
    unless node1.id == node2.id && node1.connections[node2.id]
      node1.connections[node2.id] = weight
      node2.connections[node1.id] = weight
      @queue.push(node2, weight) if !@searched[node2.id] #|| @queue[node2.id] > weight
    end
  end

  def grab_actors_for_movie(movie_id)
    Unirest.get('localhost:4567/movie/' + movie_id.to_s).body['actors']
  end

  def grab_actor(actor_id)
    actor = Unirest.get('localhost:4567/actor/' + actor_id.to_s)
    actor.body
  end

  def start_search(start_id, end_id)
    reset
    sol = search(add_actor(start_id, 0), end_id)
    puts "Counter #{@counter}"
    p sol
  end

  def reset
    @nodes = {}
    @queue = PriorityQueue.new
    @searched = {}
    @counter = 0
  end

  def search(node, end_id)
    puts node.id
    @counter += 1
    @searched[node.id] = true
    find_connections(node.id)
    puts node.connections[end_id]
    return ["Distance: #{node.weight + 1}", "End ID: #{end_id}"] if node.connections[end_id]
    next_node = @queue.unshift
    return search(next_node, end_id) << "ID: #{node.id}"
  end
end
