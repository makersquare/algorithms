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
    #     :books => ##,
    #     :good_tokens => ##,
    #     :most_popular_words => {}
    #   },
    #   :astronomy => {
    #     :words => ##,
    #     :books => ##,
    #     :good_tokens => ##,
    #     :most_popular_words => {}
    #   },
    # }
    #

# Creating Hash of categories in order to build the data structure above.
    @categories = Hash.new(0)

# Calling every sample book in each category folder.
    @all_books.each do |category, books|

# Building out the categories data structure.      
      @categories[category] = {
        :words => 0,
        :books => 0,
        :good_tokens => 0,
        :most_popular_words => Hash.new(0)
      }

# Itereating throuch each book.
      books.each do |title, array_of_words|

# Counting the amount of words in all books of a specific category.
        @categories[category][:words] += array_of_words.length

# Counting the number of books within each category.
        @categories[category][:books] += 1

# Iterating through all words in each book.
        array_of_words.each do |word|

# Building the :most_popular_words hash. Word is the key, the amount of times it shows up is the value.
          @categories[category][:most_popular_words][word] += 1

# Counts the number of good tokens in each category.
          if good_token?(word)
            @categories[category][:good_tokens] += 1
          end
        end

# Only keeps popular words if they appear more than 200 times and is a good token.
        @categories[category][:most_popular_words].keep_if { |k, v| v > 200 && good_token?(k) }
        
      end
    end
  end



  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)

# Declaring the predicted category variable.
    predicted_category = nil

# Declaring the difference variable.
    difference = 0

# Declaring a variable for minimum distance.
    minimum_distance = 99999999999999999999

# Declaring a variable for minimum tokens.    
    minimum_tokens = 99999999999999999999

# Declaring variable for amount of good tokens.    
    amount_of_good_tokens = 0

# Declaring variable for amount of popular words.
    popular_words = 0

# Setting an amount for amount of good tokens variable.
    tokens.each do |token|
      if good_token?(token)
        amount_of_good_tokens += 1
      end
    end

# Iterating through each category.
    @categories.each do |category, stats|
      popular_words = 0
      # difference_possibility = 0
      # average_words_per_book = stats[:words].to_f / stats[:books]
      # average_good_tokens = stats[:good_tokens].to_f / stats[:books]
      # word_count_frequency_difference = (tokens.length / average_words_per_book).abs
      # good_token_frequency_difference = (amount_of_good_tokens / average_good_tokens).abs


      # difference_possibility += word_count_frequency_difference
      # difference_possibility += good_token_frequency_difference

      # stats[:most_popular_words].flatten.each do |word|
      #   tokens.each do |token|
      #     if token == word
      #       popular_words += 1
      #     end
      #   end
      # end

      # popular_words = popular_words / stats[:books]
      # popular_words_frequency_difference = popular_words / stats[:most_popular_words].length

      # difference_possibility += popular_words_frequency_difference

      # if difference_possibility < minimum_distance
      #   minimum_distance = difference_possibility
      #   predicted_category = category
      # end

      # if popular_words > min
      #   min = popular_words
      #   predicted_category = category
      # end

    end

# Returning the predicted category for this book.
    return predicted_category

  end
end