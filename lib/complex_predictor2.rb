require_relative 'predictor'
require 'set'
# require 'Math'
require 'pry-byebug'

class ComplexPredictor2 < Predictor
  
  def train!
    @data = {}
    @idf = Hash.new(0)
    counter = 0
    
    @all_books.each do |category, books|
    
      @data[category] = {
        tf_words: Hash.new(0),
        tf_idf_score: Hash.new
      }
      books.each do |_, tokens|
        counter += 1
        tokens = good_tokens(tokens)

        build_histogram(@data[category][:tf_words],tokens)

        set_tokens = Set.new(tokens)
        build_counter(@idf, set_tokens) 
      end
      max = @data[category][:tf_words].max_by {|_,v| v}.last
      @data[category][:tf_words].each do |key,val| 
        @data[category][:tf_words][key] = (val / max.to_f) 
      end      
    end
    
    @idf.each {|key,val| @idf[key] = Math.log(counter / val)}

    @all_books.each do |category, _|
      @data[category][:tf_words].each do |key,val|
        @data[category][:tf_idf_score][key] = val * @idf[key]
      end
    end

  end

  def good_tokens(tokens)
    tokens.select {|x| good_token?(x) }
  end

  def build_counter(idf_words_hash, tokens_set)
    tokens_set.each do |token|
      idf_words_hash[token] += 1
    end
  end

  def build_histogram(tf_words_hash, tokens)
    tokens.each do |token|
      tf_words_hash[token] += 1
    end
  end

  def predict(tokens)
    book_tokens = good_tokens(tokens)
    book_hash = Hash.new(0)
    build_histogram(book_hash, book_tokens)

    max_count = 0
    probably_category = nil
    
    @data.each do |category, _|
      point_counter = 0
      book_hash.each do |word,count|
        if @data[category][:tf_idf_score][word]
          point_counter += count * @data[category][:tf_idf_score][word]
        else
          point_counter += count * 0
        end
      end
      if point_counter > max_count
        max_count = point_counter
        probably_category = category
      end
    end
    probably_category
  end
end