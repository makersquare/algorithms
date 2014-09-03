require_relative 'predictor'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!
    @data = {}

    @all_books.each do |category, books|
      @data[category] = {
        words: 0,
        books: 0,
        top_words: []
      }
      books.each do |filename, tokens|
        @data[category][:words] += tokens.count
        @data[category][:books] += 1
        cutoff_val = good_token_count(tokens).values.sort[-10]
        @data[category][:top_words] = @good_token_count.select{|k,v| v>= cutoff_val}
      end
    end


  end

  def good_token_count(tokens)
    @good_token_count = {
      #token1: 70,
      #token2: 50
    }

    tokens.each do |t|
      if good_token?(t) && @good_token_count[t] == nil
        @good_token_count[t] = 1
      elsif good_token?(t) && @good_token_count[t]
        @good_token_count[t] += 1
      end
    end

    @good_token_count
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

