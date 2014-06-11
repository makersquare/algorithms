require 'unirest'

class DBGOD

  def self.add_records(db_count, add_to_db_count=true, reset_db=false)
    if reset_db
      reset_database
      add_kevin_bacon
    end

    add_to_db_count ? starting_count = self.count_db_items : starting_count = 0

    while self.count_db_items <= db_count + starting_count
      next_in_line = grab_next_queue_item
      if next_in_line['type'] == "actor"
        actor = Actor.get(next_in_line['id'])
        self.save_movies_for_actor(actor)
        puts "Movies: #{Movie.count}"
      else
        movie = Movie.get(next_in_line['id'])
        self.save_actors_for_movie(movie)
        puts "Actors: #{Actor.count}"
      end
      sleep 0.5
    end
  end

  def self.save_movies_for_actor(actor)
    movies = self.pull_actor(actor['movie_db_key'])['cast']
    movies.each do |movie|
      if Movie.all(movie_db_key: movie['id'], name: movie['title']).length == 0 && Queue.all(movie_db_key: movie['id'], name: movie['title']).length == 0
        movie = self.save_movie(self.convert_item_to_hash(movie))
        self.save_queue_item(movie, "movie")
      else
        binding.pry unless Movie.all(movie_db_key: movie['id']).first
        movie = Movie.all(movie_db_key: movie['id']).first
      end
      binding.pry unless actor
      self.connect_actor_to_movie(actor,movie)
    end
  end

  def self.convert_item_to_hash(item)
    hash = {}
    hash['name'] = item['name'] if item['name']
    hash['name'] = item['title'] if item['title']
    hash['movie_db_key'] = item['id'] if item['id']
    hash['year'] = item['release_date'].split("-").first.to_i if item['release_date']
    hash['year'] = item['year'] if item['year']
    hash
  end

  def self.save_actors_for_movie(movie)
    actors = self.pull_movie(movie['movie_db_key'])['cast']
    actors.each do |actor|
      if Actor.all(movie_db_key: actor['id'], name: actor['name']).length == 0 && Queue.all(movie_db_key: actor['id'], name: actor['name']).length == 0
        actor = self.save_actor(self.convert_item_to_hash(actor))
        self.save_queue_item(actor, "actor")
      else
        actor = Actor.all(movie_db_key: actor['id']).first
      end
      binding.pry unless actor
      self.connect_actor_to_movie(actor, movie)
    end
  end

  def self.count_db_items
    count = 0
    count += Actor.count
    count += Movie.count
    count += ActorMovie.count
  end

  def self.grab_next_queue_item
    q = Queue.first
    sol = {'type' => q.type, 'id' => q.db_id, 'name' => q.name, 'movie_db_key' => q.movie_db_key}
    q.destroy
    sol
  end

  def self.add_kevin_bacon
    item = { 'name' =>'Kevin Bacon', 'movie_db_key' => 4724 }
    # self.save_actor(item)
    self.save_queue_item(self.save_actor(item), 'actor')
  end

  def self.save_queue_item(item, type)
    q = Queue.new
    q.type = type
    q.name = item['name']
    q.db_id = item['id']
    q.movie_db_key = item['movie_db_key']
    q.save
  end

  def self.reset_database
    Actor.auto_migrate!
    Movie.auto_migrate!
    ActorMovie.auto_migrate!
    Queue.auto_migrate!
  end

  def self.get_actor_id(name)
    response = Unirest.get('https://api.themoviedb.org/3/search/person?api_key=' + ENV['MOVIEDB_API_KEY'].to_s + '&query=' + name.to_s)
    response.body["results"].first["id"]
  end

  def self.pull_movie(id)
    Unirest.get('https://api.themoviedb.org/3/movie/' + id.to_s + '/credits?api_key=' + ENV['MOVIEDB_API_KEY']).body
  end

  def self.pull_actor(id)
    Unirest.get('https://api.themoviedb.org/3/person/' + id.to_s + '/movie_credits?api_key=' + ENV['MOVIEDB_API_KEY']).body
  end

  def self.save_movie(opt={})
    params = {name: opt['name'], year: opt['year'], movie_db_key: opt['movie_db_key']}
    Movie.first_or_create(conditions = params, attributes = params)
  end

  def self.save_actor(opt={})
    params = {name: opt['name'], movie_db_key: opt['movie_db_key']}
    Actor.first_or_create(conditions = params, attributes = params)
  end

  def self.connect_actor_to_movie(actor, movie)
    opt = {actor_id: actor["id"], movie_id: movie["id"]}
    ActorMovie.first_or_create(conditions = opt, attributes = opt)
  end

end



