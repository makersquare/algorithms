DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/development.db")

class Movie
  include DataMapper::Resource
  property :id,           Serial
  property :name,         String, :required => true
  property :movie_db_key,  Integer, :required => true
  property :year,         Integer, :required => true
  has n, :actor_movies
  has n, :actors, :through => :actor_movies
end

class Actor
  include DataMapper::Resource
  property :id,           Serial
  property :name,         String, :required => true
  property :movie_db_key,  Integer, :required => true
  has n, :actor_movies
  has n, :movies, :through => :actor_movies
end

class ActorMovie
  include DataMapper::Resource
  property :id,           Serial
  belongs_to :actor, :key => true
  belongs_to :movie, :key => true
end

class Queue
  include DataMapper::Resource
  property :id,           Serial
  property :type,         String, :required => true
  property :name,         String, :required => true
  property :db_id,        Integer, :required => true
  property :movie_db_key,  Integer, :required => true
end

DataMapper.finalize
