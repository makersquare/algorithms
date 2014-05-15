require_relative 'predictor'
require 'pry'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!
      @data = {}

      #access the array of strings (book content)
      @all_books.each do |category, books|
        books.each do |book|
          # filename = book[0]
          # create variable for array of strings, @words
          @words = book[1].length
        end
      end
# binding.pry
      #create a hash with keys => words, count => # of occurrences
      # frequency = Hash.new(0)
      # @words.each do |word|
      # frequency[word] += 1
      # end

      #sort the frequency of words by length
      # @sorted = frequency.sort_by {|word, occurrences| occurrences}
      # binding.pry
  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)

    @words = tokens

    if tokens.include? 'theology' && 'philosophy' && 'external'
      :philosophy
    elsif tokens.include? 'Holy' && 'scripture' && 'God'
      :religion
    elsif tokens.include? 'skeleton'
      :archeology
    elsif tokens.include? 'astronomer' && 'moon' && 'star'
      :astronomy
    end
    # binding.pry
  end
end
