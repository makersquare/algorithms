require_relative 'predictor'
require 'pry-byebug'

class ComplexPredictor < Predictor

  def train!
    @data = {}
    @top_token_words = {}

    @all_books.each do |category, books|
      @data[category] = {
        token: {}
      }
      books.each do |filename, tokens|
        tokens.each do |token|
          #  i thought nested if statements were no-nos so patrick helped me with this part. 
          if good_token?(token)
            if @data[category][:token][token]
              @data[category][:token][token] += 1
            else
              @data[category][:token][token] = 1
            end
          end
        end
      end
    end
    top_tokens = nil

    @data.each do |category, token|
      # binding.pry
      top_tokens = @data[category][:token].sort_by { |token, count| count }.reverse[0..15]
      @top_token_words[category] = []
      # yusef helped me through a tricky time with arrays and string and stuff in my hash value
        top_tokens.each do |x|
          if @top_token_words[category]
            @top_token_words[category] << x[0]
          end
        end
    end
  end

  def predict(tokens)

    predicted_category = nil

    max_match = 0
    @top_token_words.each do |category, top_words|
      count_match = 0
        tokens.each do |token|
          if top_words.include? token
            count_match += 1
          end
        end
        if count_match > max_match
          predicted_category = category
          max_match = count_match
        end
      end
      predicted_category.to_sym
  end
end

