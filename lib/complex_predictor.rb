require_relative 'predictor'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
attr_accessor :data
  def train!
    @data = {}


    @all_books.each do |category, books|
      @data[category] = {
        words: 0,
        books: 0,
        top_words: [] #top 10 words
      }
      books.each do |filename, tokens|
        @data[category][:words] += tokens.count
        @data[category][:books] += 1
          cutoff_val = good_token_count(tokens).values.sort[-50]
        cutoff_words = @good_token_count.select {|k,v| v >= cutoff_val}
        cutoff_words.each do |x|
        @data[category][:top_words].push(x)
      end
      end
    end
  end

  def good_token_count(tokens)
    @good_token_count = {}
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
    # :astronomy
    predicted_category = nil
    counter = 0

    predictee_top_words = []
    cutoff_val = good_token_count(tokens).values.sort[-50]
    top_words = @good_token_count.select {|k,v| v >= cutoff_val}
    top_words.each {|x| predictee_top_words.push(x)}

    @data.each do |category, cat_data|
    matching_words = (predictee_top_words & cat_data[:top_words])
      max_matches = matching_words.length
        if max_matches >= counter
          counter = max_matches
          predicted_category = category
      end
    end
  
    predicted_category
    end
    
end



