require_relative 'predictor'
require 'pry-byebug'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.



  def train!

    #iterates through all the words for each category, and creates a hash that has 
    #each word as a key, and the value is the number of times it appears.
    # @data looks like:
    # {
    #   philosophy: {
    #     word1: 10,
    #     word2: 50,
    #     ...
    #   },
    #   archeology: {
    #     word1: 15,
    #     word2: 30,
    #     ...
    #   }
    # }
    
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
        # @temp_data[category] = @data_array
        # limit = @temp_data[category][100].last
        limit = @data_array[100].last      
        @data[category].keep_if do |key, value|
          value > limit
        end
      end
    end
    # binding.pry


  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)

    input_words = {}
    match_words = {}
    category_count = {}

#put good tokens in an input words hash with their counts
    tokens.each do |token|
      if good_token?(token)
        input_words[token] ||= 0
        input_words[token] += 1
      end
    end

#find words in the input words that match our data from the train method and store in match_words hash with their count
    @data.each do |category, word_hash|
      match_words[category] = {}
      word_hash.each do |word, count|
        if input_words.has_key?(word)
          match_words[category][word] = input_words[word]
        end
      end

    end
    # binding.pry

#add up word count per category and put it in the category count hash
    match_words.each do |category, words|
      category_count[category] = match_words[category].values.inject(0) { |a, b| a + b }
    end

    # binding.pry

#return category with highest number of matches
    return category_count.max_by{|k,v| v}.first

  end
end

