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
        good_token_count(tokens).each do |x|
          @data[category][:top_words] << x
        end
        title_start = tokens.index("title")+1
        title_end = tokens.index("author")-1
        title_words = tokens[title_start..title_end]
        title_words.each do |x|
          @data[category][:top_words] << x
        end
      end
    end
  end

  def good_token_count(tokens, num=20)
    @good_token_count = {}
    @top_words = []

    tokens.each do |t|
      if @good_token_count[t] 
        @good_token_count[t] += 1
      else
        @good_token_count[t] = 1
      end
    end

    cutoff_val = @good_token_count.values.sort[-1 * num]
    cutoff_words = @good_token_count.select{|k,v| v>= cutoff_val}
    cutoff_words.each do |x|
      @top_words << x
    end

    @top_words
  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    token_count = tokens.count
    predict_common_words = []

    good_token_count(tokens).each do |x|
      predict_common_words << x
    end

    title_start = tokens.index("title")+1
    title_end = tokens.index("author")-1
    title_words = tokens[title_start..title_end]
    title_words.each do |x|
      predict_common_words << x
    end

    predicted_category = nil
    counter = 0

    @data.each do |category, cat_data|
      if title_words.include?(category.to_s)
        return category
      end
      matching_words = (predict_common_words & cat_data[:top_words])
      max_matches = matching_words.size

      if max_matches > counter
        counter = max_matches
        predicted_category = category 
      end
    end

    predicted_category

  end
end

