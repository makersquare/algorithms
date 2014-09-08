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
        top_words: [] 
      }
      books.each do |filename, tokens|
        # title = find_title(tokens)
        #   title.each do |t|
        #     if good_token?(t)
        #       @data[category][:top_words].push(t)
        #     end
        #   end
        @data[category][:words] += tokens.count
        @data[category][:books] += 1
        good_token_count(tokens).each { |x| @data[category][:top_words].push(x) }
      end
    end
  end

  def good_token_count(tokens)
    @good_token_count = {}
    @top_words = []
    tokens.each do |t|
      if good_token?(t) && @good_token_count[t] == nil
          @good_token_count[t] = 1
      elsif good_token?(t) && @good_token_count[t]
          @good_token_count[t] += 1
      end
    end
    cutoff_val = @good_token_count.values.sort[-50]
    top_words = @good_token_count.select {|k,v| v >= cutoff_val}
    top_words.each {|word, count| @top_words.push(word)}  
    @top_words
  end      

  # def find_title(tokens)
  # title_start = tokens.index("title") 
  # title_end = tokens.index("author")
  # title = tokens[title_start...title_end]
  # title.delete("title")
  # title 
  # end   
 


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

    predictee_top_words = good_token_count(tokens)
    # title_test = find_title(tokens)

    @data.each do |category, cat_data|
    matching_words = (predictee_top_words & cat_data[:top_words])
      max_matches = matching_words.length
        if max_matches >= counter
          counter = max_matches
          predicted_category = category
      end
    #     if title_test.include?(category.to_s)
    #     predicted_category = category
    # end 
    end    
    predicted_category
    end
    
end



