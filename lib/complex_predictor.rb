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
        uniq_words: Hash.new(0),
        authors: []
      }

      books.each do |filename, token|
        token.each do |word|
          if good_token?(word) && word.length > 5
            @data[category][:uniq_words][word] += 1
          end
        @author_start = token.find_index("by")
        @data[category][:authors] << token[(@author_start + 1)..(@author_start+2)]
        end
      end
      @data[category][:uniq_words] = @data[category][:uniq_words].sort_by {|key, value| value}.reverse[0..14]
      binding.pry
    end

     #@date = {
     #unq_word: []
     #book:
     # 
     #
     #}
  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    # Always predict astronomy, for now.
    :astronomy
  end
end

