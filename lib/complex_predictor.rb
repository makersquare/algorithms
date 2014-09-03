require_relative 'predictor'
require 'pry-byebug'

class ComplexPredictor < Predictor
# @tokenHash = Hash.new(0)

  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!
    @data = {}


    # binding.pry
    @all_books.each do |category, books|
      @data[category] = {
        keys:[]
      }

      tokenHash = Hash.new(0)
      books.each do |filename, tokens|
        tokens.each do |word|
          if good_token?(word)
          tokenHash[word]+= 1
          end
        end
      end
                 a= tokenHash.sort_by{|x,y| y}[-10..-1]
                 a.map!{|x| x[0]}
                 @data[category][:keys] = a
    end

  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    @decider = {
      religion:0,
      philosophy:0,
      astronomy:0,
      archeology:0
    }
      tokens.each do |word|
        @data.each do |key,val| 
          # val.values[0]
          # p key
          # p val
            if val.values[0].include?(word)
              @decider[key]+=1
            end
        end
      end
    # puts @data
     # puts @decider
    return @decider.max_by{|x,y| y}[0]
  end
end

