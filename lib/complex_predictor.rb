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
      @data[category] = Hash.new(0)
      tokenHash = Hash.new(0)
      books.each do |filename, tokens|
        tokens.each do |word|
          if word.length > 4 && good_token?(word) 
          tokenHash[word]+= 1
          end
        end
      end
       @data[category][:keys] = tokenHash.sort_by{|x,y| y}[-3..-1].map!{|x| x[0]}
    end
  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    @decider = Hash.new(0)
    tokens.each do |word|
      @data.each do |key,val| 
        if val.values[0].include?(word)
          @decider[key]+=1
        end
      end
    end
    p @data
    return @decider.max_by{|x,y| y}[0]
  end
end

