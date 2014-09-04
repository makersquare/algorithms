require_relative 'predictor'
require 'pry-byebug'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!

    # Data Structure:
    #
    # @categories = {
    #   :philosophy => {
    #     :words => ##,
    #     :books => ##
        # :good_tokens => ##
        # :most_popular_words => []
    #   },
    #   :astronomy => {
    #     :words => ##,
    #     :books => ##
        # :good_tokens => ##
        # :most_popular_words => []
    #   },
    # }
    #

    @categories = Hash.new(0)
    # @most_popular_words = Hash.new(0)

    @all_books.each do |category, books|
      @categories[category] = {
        :words => 0,
        :books => 0,
        # :good_tokens => 0,
        :most_popular_words => []
      }
      @words = Hash.new(0)
      books.each do |title, array_of_words|
        @categories[category][:words] += array_of_words.length
        @categories[category][:books] += 1
        array_of_words.each do |word|
          @words[word] += 1
          # if self.good_token?(word)
          #   @categories[category][:good_tokens] += 1
          # end

        end
        popular_words = @words.sort_by { |k, v| v }.reverse.keep_if { |k, v| v < 100 && v > 20 }
        popular_words.each do |v|
          @categories[category][:most_popular_words] << v[0]
        end
      end
      @categories[category][:most_popular_words].delete_if { |word| self.good_token?(word)}
      binding.pry
    end
  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)

    predicted_category = nil
    minimum_distance = 99999999999999999999
    # minimum_tokens = 99999999999999999999
    # amount_of_good_tokens = 0
    # magic_word = nil
    # @categories.each do |cat, stats|
    #   stats[:magic_words][:philosophy] = 0
    #   stats[:magic_words][:astronomy] = 0
    #   stats[:magic_words][:religion] = 0
    #   stats[:magic_words][:archaeology] = 0
    # end

    # tokens.each do |token|
    #   if self.good_token?(token)
    #     amount_of_good_tokens += 1
    #   end
    # end

    # @categories.each do |category, stats|

      # average_words_per_book = stats[:words].to_f / stats[:books]
      # word_count_difference = (tokens.length - average_words_per_book).abs
      # good_token_difference = (amount_of_good_tokens.to_f - stats[:good_tokens])

      # magic_word = stats[:magic_words].sort_by { |key, value| value }.last

      # if magic_word == category && word_count_difference < minimum_distance && good_token_difference < minimum_tokens
      #   predicted_category = category
      #   minimum_distance = word_count_difference
      #   minimum_tokens = good_token_difference
      # end   

        

      # if predicted_category == nil && word_count_difference < minimum_distance && good_token_difference < minimum_tokens
      #   predicted_category = category
      #   minimum_distance = word_count_difference
      #   minimum_tokens = good_token_difference
      # end

      

      # if predicted_category == nil && word_count_difference < minimum_distance
      #   predicted_category = category
      #   minimum_distance = word_count_difference
      # # else
      # #   predicted_category = category
      # end

    # end

    # predicted_category

  end
end