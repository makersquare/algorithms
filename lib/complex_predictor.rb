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
          if good_token?(word) && word.length > 7
            @data[category][:uniq_words][word] += 1
          end
        end
        @author_start = token.find_index("by")
        @data[category][:authors] << token[(@author_start + 1)..(@author_start+2)]
        end
        @new_hash = Hash.new(0)
        @most_pop = @data[category][:uniq_words].sort_by {|key, value| value}.reverse[0..100]
        @most_pop.map! {|word, count| word}
        # @most_pop.each do |x|
        #   @new_hash[x.first] = x.last
        # end
        @data[category][:uniq_words] = @most_pop
        
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
    @match = Hash.new(0)
    @data.each do |category, uniq|
      @match[category] = (@data[category][:uniq_words] & tokens).length
    end
    @match.max_by {|category, count| count }.first
   end

end

