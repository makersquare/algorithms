require 'set'
require 'find'

class Predictor
  CATEGORIES = [:astronomy, :philosophy, :religion, :archeology]
  STOP_WORDS = Set.new(File.read('data/stopwords.txt').split(','))

  # Public: Initialize object.
  #
  # opts - Options:
  #   :sample - Use sample dataset if true. Defaults to false.
  #
  # Returns new Predictor object.
  def initialize(opts={})
    # Hash of arrays that looks like this:
    #
    # {
    #   :philosophy => [[file_name, array_of_words], ...]
    #   :physics => ...,
    #   ...
    # }
    @all_books = load_books(:training)
  end

  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!
    raise "You must implement Predictor#train!."
  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    raise "You must implement Predictor#predict."
  end

  # Returns true if you should use this token. In our project, "token" is
  # synonymous with "word".
  def good_token?(token)
    !STOP_WORDS.include?(token) && token.size > 2
  end

  #############################################################################
  # You probably don't need to understand the methods below to complete the
  # project.
  #############################################################################

  # Public: Run the test set by calling predict.
  #
  # opts - Options
  #   :debug - Defaults false.
  #
  # Returns nothing.
  def predict_test_set(opts={})
    right = 0
    wrong = 0

    @all_books = load_books(:test)
    @all_books.each do |category, books|
      books.each do |filename, book|
        prediction = predict(book)
        if prediction == category.to_sym
          right += 1
          puts "Correct! Predicted #{prediction}. #{filename}." if opts[:debug]
        else
          wrong += 1
          puts "Wrong.   Predicted #{prediction} instead of #{category}. #{filename}." if opts[:debug]
        end
      end
    end

    accuracy = right.to_f / (right + wrong)
    puts "Accuracy: #{accuracy}" if opts[:debug]
    accuracy
  end


  private

  # Internal: Given a string, split into array of words.
  #
  # Example:
  #
  # tokensize("hello world")
  def tokenize(string)
    require 'iconv' unless String.method_defined?(:encode)
    if String.method_defined?(:encode)
      string.encode!('UTF-8', 'UTF-8', :invalid => :replace, :undef => :replace)
    else
      ic = Iconv.new('UTF-8', 'UTF-8//IGNORE')
      string = ic.iconv(string)
    end
    string.split(/\W+/).map(&:downcase) # Split by non-words
  end

  # Internal: Load books from files.
  #
  # dataset - The dataset to use: sample, training, test.
  #
  # Returns hash of category to books like this:
  #
  # {
  #   :philosophy => [[filename, book_content], ...]
  # }
  #
  def load_books(dataset, opts={})
    books = {}
    CATEGORIES.each do |category|
      books[category] = []
      Find.find("data/#{dataset}/#{category}") do |file|
        next if File.directory?(file)
        next if file.split("/").last[0] == "." # Ignore hidden files

        content = tokenize(File.read(file))
        books[category] << [file, content]
      end
    end
    books
  end
end

