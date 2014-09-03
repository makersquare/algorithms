require_relative 'predictor'
require 'pry-byebug'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!
    @data = {}

    @all_books.each do |category, books|
      @data[category] = {
        common_words: [],
        special_words: []
      }
      books.each do |_, tokens|
        tokens = good_tokens(tokens)
        histogram = build_histogram(tokens)

        commons = common_words(histogram)
        commons.each { |word| @data[category][:common_words] << word }

        specials = special_words(histogram)
        specials.each { |word| @data[category][:specials_words] << word }
      end
    end
    uniquify
    kill_doubles
  end

  def uniquify
    @data.each do |category,_|
      @data[category][:common_words] = @data[category][:common_words].uniq
    end
  end

  def kill_doubles
    kill_list = {}
    @data.each do |category, _|
      kill_list[category] = []
      @data.each do |categories, _|
        if categories != category
          @data[categories][:common_words].each do |word|
            kill_list[category] << word
          end
        end
      end
    end
    @data.each do |category, _|
      @data[category][:common_words].each do |word|
        @data[category][:common_words].delete(word) if kill_list.include?(word)
      end
    end
  end

  def good_tokens(tokens)
    tokens.select {|x| good_token?(x) }
  end

  def build_histogram(tokens)
    histo = Hash.new(0)
    tokens.each do |token|
      histo[token] += 1
    end
    histo = Hash[histo.sort_by {|key,val| val}.reverse]
    histo
  end

  def common_words(histo)
    histo.keys.take(25)
    # alternate for most common words
  end

  def special_words(histo)
    histo.keys.take_while {|word| word.length > 10}
    # alternate length
  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    tokens = good_tokens(tokens)
    histogram = build_histogram(tokens)
    commons = common_words(histogram)
    specials = special_words(histogram)

    probably_category = nil
    max_count = 0

    @data.each do |category, _|
      point_counter = 0
      commons.each do |word|
        point_counter += 1 if @data[category][:common_words].include?(word)
      end
      # specials.each do |word|
      #   point_counter += 1 if @data[category][:special_words].include?(word)
      # end
      if point_counter > max_count
        max_count = point_counter
        probably_category = category
      end
    end
    probably_category
  end
end