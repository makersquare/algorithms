

require_relative 'predictor'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.

#Returns an array of the 20 most popular words
  # def get_popular_words(tokens)
  #   puts "starting get_popular_words"
  #   popular_words = {}
  attr_reader :categories

  @categories = []





  #   # tokens.each do |word|
  #     # if popular_words.has_key?(word) == false
  #     #   count = tokens.count(word)
  #     #   popular_words.store(word, count)
  #     # end
  #   end

  #  #sorted_popular_words = popular_words.sort_by {|k,v| v}.reverse
  #  puts "ending get_popular_words"
  #  #sorted_popular_words[0..19]
   
  # end

  def train!

    @data = {}

    # @data = {
    # :astronomy => {:pop_words =>  , :pop_words => },
    # :philosophy => {:pop_words => },
    # :religion => {:pop_words => }, 
    # :archeology => {:pop_words => } 
    # }

     @all_books.each do |category, books|
      @data.store(category, 0)
      books.each do |filename, tokens| 
        cat_count = tokens.count(category.to_s)
        @data.store(category, cat_count)
        #@categories << category
      end
     end

  end



  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
     
     data_predict = {}
     @all_books.each do |category, books|
      data_predict.store( category, tokens.count(category.to_s) )
      puts category
      puts tokens.count(category.to_s)
     end

     max_count = 0
     return_cat = ""
     cats = data_predict.keys
     data_predict.each do |cat, count|
      if count > max_count
        max_count = count
        return_cat = cat
      end
     end

    if return_cat == ""
      return_cat = cats.sample
    end

    return_cat

  end
   

end

