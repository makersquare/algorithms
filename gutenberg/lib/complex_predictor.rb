require_relative 'predictor'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!
    @data = Hash.new()

    get_categories(@data, @all_books)
    compile_words_by_category(@data, @all_books)
    build_top_words_hash_for_each_category(@data, 50)
  end

  def build_top_words_hash_for_each_category(compiled_words_by_category_hash, number_of_pop_words)
    @data.each do |category, books|
      histogram = build_histogram(books)
      top_words = find_top_words(histogram, number_of_pop_words)
      @data[category] = top_words
    end
  end

  def get_categories(empty_hash, given_books)
    given_books.keys.each {|key| empty_hash[key] = []}
  end

  def compile_words_by_category(categories_hash, given_books)
    given_books.each do |category, books|
      books.each do |book|
        book[1].each do |word|
          categories_hash[category] << word
        end
      end
    end
  end

  def build_histogram(array)
    histogram = Hash.new(0)

    array.each do |word|
      if good_token?(word)
        histogram[word] += 1
      end
    end

    histogram
  end

  def find_top_words(histogram, number_of_words)
    sorted =  histogram.sort_by {|k, v| v}
    Hash[sorted[-number_of_words..-1]]
  end


  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    book_histogram = build_histogram(tokens)
    top_words_for_book = find_top_words(book_histogram, 300)
    decide_category(top_words_for_book, @data)
  end

  def decide_category(top_words, training_data)
    count_hash = Hash.new(0)
    training_data.each do |category, pop_words|
      top_words.each_key do |word|
        if pop_words.has_key?(word)
          count_hash[category] = count_hash[category] + 1
        end
      end
    end
    count_hash.max_by{|k,v| v}.first
  end
end


