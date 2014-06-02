require 'sinatra'
require 'json'
require 'pry-debugger'
require 'data_mapper'
require_relative 'lib/classes.rb'

require './env' if File.exists?('env.rb')
require_relative 'lib/database_builder.rb' # Only use to build the database initially

get '/' do
  "Movie Database! Use /actor/id or /movie/id to get data"
end

get '/actor' do
  Actor.all.map { |actor| actor.name }.join("\n")
end

get '/actor/:id' do
  content_type :json
  actor = Actor.get(params[:id])

  movies = []
  actor.movies.each { |movie| movies << { name: movie.name, id: movie.id, year: movie.year } }

  {name: actor.name, id: actor.id, movies: movies}.to_json
end

get '/movie' do
  Movie.all.to_json
end

get '/movie/:id' do
  content_type :json
  movie = Movie.get(params[:id])

  actors = []
  movie.actors.each { |actor| actors << { name: actor.name, id: actor.id } }

  {name: movie.name, id: movie.id, year: movie.year, actors: actors}.to_json
end

get '/search/actor/:name' do
  search_result = Actor.all.select { |actor| actor.name.downcase.split(" ").join("") == params[:name].downcase }
  res = []
  search_result.each do |actor|
    movies = []
    actor.movies.each { |movie| movies << { name: movie.name, id: movie.id, year: movie.year } }
    res << { name: actor.name, id: actor.id, movies: movies }
  end
  res.to_json
end

get '/search/movie/:name' do
  search_result = Movie.all.select { |movie| movie.name.downcase.split(" ").join("") == params[:name].downcase }
  res = []
  search_result.each do |movie|
    actors = []
    movie.actors.each { |actor| actors << {name: actor.name, id: actor.id } }
    res << { name: movie.name, id: movie.id, year: movie.year, actors: actors }
  end
  res.to_json
end

# puts ENV['MOVIEDB_API_KEY']
