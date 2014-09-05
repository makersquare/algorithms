require_relative 'predictor'
require 'pry-byebug'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!
    @data = {}

    @all_books.each do |category, books|
      @data[category] = {
        all_words: Hash.new(0),
        magic_words: Array.new
      }
      books.each do |filename, tokens|
        tokens.each do |token|
          if good_token?(token)
            @data[category][:all_words][token] += 1
          end
        end
      end
      popular_words = most_popular_words_array(@data[category][:all_words])
      @data[category][:magic_words] = popular_words
    end
  end

  def most_popular_words_array(words_hash)
    pop_words = words_hash.sort_by { |k, v| v }.reverse
    pop_words_array = []
    pop_words.each do |word| 
      pop_words_array << word[0]
    end
    pop_words_array.take(1000)
  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    prediction = Hash.new(0)
    @data.each do |category, stats|
      prediction[category] = (@data[category][:magic_words] & tokens).length
    end
    prediction.max_by { |k, v| v }.first
  end
end
