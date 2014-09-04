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
      @data[category] = Hash.new(0)
      books.each do |filename, tokens|
        tokens.each do |token|
          if good_token?(token)
            @data[category][token] += 1
          end
        end
      end
      sorted = sort_words(@data, category)
      top_words = get_top_words(sorted)
      @data[category][:top_words] = top_words
    end
  end

  def sort_words(data, category)
    data[category].sort_by { |k,v| v }.reverse
  end

  def get_top_words(sorted)
    top = sorted.take(900)
    top.map! { |word, count| word }
  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    counts = Hash.new(0)
    @data.each do |category, _|
      counts[category] = (tokens & @data[category][:top_words]).length
    end
    counts.max_by { |k,v| v }.first
  end
end