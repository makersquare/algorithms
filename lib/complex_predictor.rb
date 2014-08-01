require_relative 'predictor'
require 'pry-byebug'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.

  def train!
    # iterates through all the words for each category, and creates a hash that has 
    # each word as a key, and the value is the number of times it appears.
    
    @data = {}
    @temp_data = {}

    @all_books.each do |category, books|
      @data[category] = {}
      @temp_data[category] = {}
      books.each do |filename, tokens|
        tokens.each do |token|
          if good_token?(token)
            @data[category][token] ||= 1
            @data[category][token] += 1
          end
        end
        @data_array = @data[category].sort_by {|k,v| v}.reverse
        limit = @data_array[100].last      
        @data[category].keep_if do |key, value|
          value > limit
        end
      end
    end

  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)

    input_words = {}
    match_words = {}

# put good tokens in an input_words hash with their counts
    tokens.each do |token|
      if good_token?(token)
        input_words[token] ||= 1
        input_words[token] += 1
      end
    end

# find words in the input_words hash that match words from the @data hash and
# create match_words hash that counts total number of words from each category
    @data.each do |category, word_hash|
      word_hash.each do |word, count|
        if input_words.has_key?(word) 
          match_words[category] ||= 1
          match_words[category] += input_words[word]
        end
      end
    end

#return category with highest number of matches
    return match_words.max_by{|k,v| v}.first

  end

end

