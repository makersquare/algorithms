require_relative 'predictor'
require 'pry-byebug'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  #This algorithm gets the top 100 most frequent words above 7 letters that occur across all books
  #for the given subject. Next, it compares the words
  def train!
    @subjects = []
    @points = Hash.new(0)
    @data= {}
    @words = Hash.new(0)
    @all_books.each do |category, books|
      books.each do |filename, words|
        words.each do |word|
          if word.length > 6
            @words[word] += 1
            #binding.pry
          end
          
        end
        @subjects.push([filename.split("/")[2]])
        @points[category]=0
        words_freq = @words.sort_by{|key, value| value}[-100..-1]
        words_only = words_freq.map{|pair| pair[0]}
        @data[category] = words_only
      end
    end
#create a hash with the word frequency for each one
#check to see how many top 20 words match. just like the min one, the closest match or the one with the most
#similar terms gets selected

  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.

  #create a new hash with the subject and a corresponding points value field
  #run the first test and assign a point to the hash for the proper one
  #search the first 500 words for a word match to the subject, which is found inside the file name
  #if there is a match, assign a point to the new hash
  #additionally you can run the simple version to try to add another point
  def predict(tokens)
    @minimum_category = nil
    @minimum_distance = 999999999
    @token_words = Hash.new(0)
    @points = Hash.new(0)
    #gets the top 100 words and compares the difference
    tokens.each do |token|
      if token.length > 6
        @token_words[token] +=1
      end
    end
    sorted_token_words = @token_words.sort_by{|key, value| value}[-100..-1]
    only_words = sorted_token_words.map{|pair| pair[0]}
    @difference = nil
    @data.each do |category, word_list| 
      @difference = @data[category] - only_words
      difference_count = @difference.count 
      if difference_count < @minimum_distance
        @points[category] += 1
        @minimum_distance = difference_count
      end
      @subjects.each{|subject| if tokens[0..5000].include?(subject) then @points[category]+=1 end}

    end
    # binding.pry
    p "stop"
    #iterate through points to get the highest value and pass the key **********
    cat = @points.sort_by{|k,v| v}[-1][0]
    cat
  end
end

    #compare sorted_token_words to each @data[:category] hash to see how many words match
    #calculate matching words or missing words number and store that as minimum difference
    #store the subject as minimum subject
    #do the next category and if the minimum difference is larger swap out values
    #return the minimum subject
    #
    # Always predict astronomy, for now.
