require_relative 'predictor'

# This is a simple predictor that isn't very smart, but it's not too shabby. It
# gets 40% of its predictions correct, which is better than random! But I bet
# you can do better than 40%, so use SimplePredictor as an example to implement
# ComplexPredictor.
#
class SimplePredictor < Predictor

  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!
    # @data looks like:
    #
    # {
    #   philosophy: {
    #     words: 1000,
    #     books: 10,
    #   },
    #   archeology: {
    #     words: 2000,
    #     books: 5,
    #   }
    # }
    @data = {}

    @all_books.each do |category, books|
      @data[category] = {
        words: 0,
        books: 0
      }
      books.each do |filename, tokens|
        @data[category][:words] += tokens.count
        @data[category][:books] += 1
      end
    end
  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    # Find the category that has the most similar word-count.
    #
    # Example: Say the average Archeology book has 50 words and the average
    # Philosophy book has 100 words. Then say we must predict some book with 120
    # words. In this case, we will predict Philosophy, since 120 is closer to 100
    # than it is to 50.

    minimum_category = nil
    minimum_distance = 999999999999

    @data.each do |category, counts|
      average_words_per_book = counts[:words].to_f / counts[:books]
      difference = (tokens.count - average_words_per_book).abs

      if difference < minimum_distance
        minimum_category = category
        minimum_distance = difference
      end
    end

    minimum_category
  end
end

