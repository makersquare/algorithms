require_relative 'predictor'

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
        tokens.each {|token| @data[category][token] += 1 if token.length > 5}
      end
      @data[category] = @data[category].max_by {|k,v| v}[0]
    end
    # raise "You must implement Predictor#train!."

  # Public: Predicts category.
  
  # tokens - A list of tokens (words).
  
  # Returns a category.
  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    # # Find the category that has the most similar word-count.
    # #
    # # Example: Say the average Archeology book has 50 words and the average
    # # Philosophy book has 100 words. Then say we must predict some book with 120
    # # words. In this case, we will predict Philosophy, since 120 is closer to 100
    # # than it is to 50.
    max_occurrences = 0
    the_category = nil
    counter = Hash.new

    @all_books.each do |cat, books|
      @data.each do |category, word|
        books.each do |filename, tokens|
          counter[category] = 0
          tokens.each {|token| counter[category] += 1 if token == word}
          if max_occurrences < counter[category]
            max_occurrences = counter[category]
            the_category = category
          end
        end
      end
    end

    the_category
    # # raise "You must implement Predictor#predict."
  end
end

