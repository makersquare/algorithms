require_relative 'predictor'
require 'pry-byebug'

class ComplexPredictor < Predictor
  
  def train!
    @data = {}

    @all_books.each do |category, books|
      @data[category] = {
        common_words: Set.new,
      }

      books.each do |_, tokens|
        tokens = good_tokens(tokens)
        histogram = build_histogram(tokens)
        commons = common_words(histogram)
        commons.each { |word| @data[category][:common_words] << word }
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

  def predict(tokens)
    book_tokens = good_tokens(tokens)
    book_histogram = build_histogram(book_tokens)
    book_commons = common_words(book_histogram)
 
    max_count = 0
    probably_category = nil
    
    @data.each do |category, _|
      point_counter = 0
      book_commons.each do |word|
        point_counter += 1 if @data[category][:common_words].include?(word)
      end
      if point_counter > max_count
        max_count = point_counter
        probably_category = category
      end
    end
    probably_category
  end
end