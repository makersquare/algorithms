require_relative 'predictor'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!

    @length_data = {}

    @all_books.each do |category, books|
      @length_data[category] = {
        words: 0,
        books: 0
      }
      books.each do |filename, tokens|
        @length_data[category][:words] += tokens.count
        @length_data[category][:books] += 1
      end
    end

    @data = {} # {:astronomy=>"footnote", :philosophy=>"things", :religion=>"christ", :archeology=>"gutenberg"}
    @length = {}
    bad_words = ['footnote', 'things', 'gutenberg', 'project', 'illustration']


    @all_books.each do |category, books|
      @data[category] = Hash.new(0)
      books.each do |filename, tokens|
        tokens.each {|token| @data[category][token] += 1 if token.length > 5 && bad_words.include?(token) != true }
      end
      @data[category] = @data[category].max_by {|k,v| v}[0]
    end
    # raise "You must implement Predictor#train!."
  
  # tokens - A list of tokens (words).
  
  # Returns a category.
  @data
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

    minimum_category = nil
    minimum_distance = 999999999999

    @length_data.each do |category, counts|
      average_words_per_book = counts[:words].to_f / counts[:books]
      difference = (tokens.count - average_words_per_book).abs

      if difference < minimum_distance
        minimum_category = category
        minimum_distance = difference
      end
    end



    @data.each do |category, word|
      counter[category] = 0
      tokens.each {|token| counter[category] += 1 if word == token || category.to_s == token}
      if minimum_category == category
        counter[category] += 2
      end
      if max_occurrences.to_f < counter[category]
        max_occurrences = counter[category]
        the_category = category
      end
    end
    the_category
  end
end
