require_relative 'predictor'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!
    @data = {}
    @normalize = {}

    @all_books.each do |category, books|
      wordfrequency = {}

      books.each do |filename, tokens|

        tokens[200..-200].each do |word|
          if self.good_token?(word)
            if wordfrequency[word]
              wordfrequency[word] += 1
            else 
              wordfrequency[word] = 1
            end
          end
        end
      end

      @data[category] = wordfrequency.select{|k, v| v>50}

      @normalize[category] = @data[category].values.inject(:+)
    end
  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    max_score = 0
    max_category = nil
    range_starts = tokens.length/4
    range_ends = range_starts + 500
    @data.each do |category, keywords|
      cat_score = 0
      tokens[range_starts..range_ends].each do |word|
        cat_score += keywords[word] if keywords.has_key?(word)
      end
      norm_score = cat_score.to_f * 1000 / @normalize[category]
      if norm_score > max_score
        max_score = norm_score
        max_category = category
      end
    end

    max_category
  end


end

