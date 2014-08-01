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
      @data[category] = {}
      books.each do |filename, tokens|
        tokens.each do |token|
          if good_token?(token)
            @data[category][token] ||=0
            @data[category][token] += 1 
          end
        end
      end
      @data[category] = @data[category].sort_by{ |k, v| -v }.first(100).map(&:first).flatten
    end
  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    result = []
    words_in_book = {}
    tokens.each do |token|
      if good_token?(token)
        words_in_book[token] ||= 0
        words_in_book[token] += 1
      end
    end

    words_in_book = words_in_book.sort_by{ |k, v| -v }.first(100).map(&:first).flatten

    @data.each do |key, value|
      matches = 0
      words_in_book.each do |word|
        if value.include?(word)
          matches += 1
        end
      end
      result << matches
    end
    return CATEGORIES[result.index(result.max)]
  end
end

