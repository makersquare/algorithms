require_relative 'predictor'
require 'pry-byebug'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  #This algorithm gets the top 100 most frequent words above 7 letters that occur across all books
  #for the given subject. Next, it compares the words
  def train!
    @data= {}
    @words = Hash.new(0)
    @all_books.each do |category, books|
      books.each do |filename, words|
        words.each do |word|
          if word.length > 6
            @words[word] += 1
          end
        end
        words_freq = @words.sort_by{|key, value| value}[-100..-1]
        words_only = words_freq.map{|pair| pair[0]}
        @data[category] = words_only
      end
    end
#create a hash with the word frequency for each one
#check to see how many top 20 words match. just like the min one, the closest match or the one with the most
#similar terms gets selected

  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    @minimum_category = nil
    @minimum_distance = 999999999
    @token_words = Hash.new(0)
    tokens.each do |token|
      if token.length > 6
        @token_words[token] +=1
      end
    end
    sorted_token_words = @token_words.sort_by{|key, value| value}[-100..-1]
    only_words = sorted_token_words.map{|pair| pair[0]}
    @difference = nil
    @data.each do |category, word_list| 
      @difference = @data[category] - only_words
      difference_count = @difference.count 
      if difference_count < @minimum_distance
        @minimum_category = category
        @minimum_distance = difference_count
        #binding.pry
      end
    end
    @minimum_category
  end
end

    #compare sorted_token_words to each @data[:category] hash to see how many words match
    #calculate matching words or missing words number and store that as minimum difference
    #store the subject as minimum subject
    #do the next category and if the minimum difference is larger swap out values
    #return the minimum subject
    #
    # Always predict astronomy, for now.
