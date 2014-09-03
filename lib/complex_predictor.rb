require_relative 'predictor'
require 'pry-byebug'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!
    # @data looks like:
    #
    # {
    #   philosophy: {
    #     word1 => count,
    #     top_words => [list, of, top, words, here]
    #   },
    #   archeology: {
    #     words: 2000,
    #     books: 5,
    #   }
    # }
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
      top_words_hash = {}
      top_words.each do |word|
        top_words_hash[word] = nil
      end
      @data[category][:top_words] = top_words_hash
    end
  end

  def sort_words(data, category)
    data[category].sort_by { |k,v| v }.reverse
  end

  def get_top_words(sorted)
    top = sorted.take(200)
    top.map! { |word, count| word }
  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    # Always predict astronomy, for now.
    counts = Hash.new(0)
    @data.each do |category, _|
      tokens.each do |word|
        if @data[category][:top_words].include?(word)
          counts[category] += 1
        end
      end
    end
    counts.sort_by { |k,v| v }.last.first
  end
end