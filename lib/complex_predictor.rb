require_relative 'predictor'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!
    @top_frequency = {}
    @all_books.each do |key, value|
      frequency = Hash.new(0)
      value[0][1].each do |val|
        if good_token?(val)
          frequency[val] +=1
        end
      end
      frequency = frequency.sort_by {|key, val| val}.reverse!
      frequency = frequency[0..129]
      frequency.flatten!
      frequency.delete_if {|x| x.is_a? Integer}
      @top_frequency[key] = frequency
    end
    mkfile = File.open("/home/daniel/code/algorithms/lib/txt/train.txt","a")
    mkfile.write(@top_frequency)
    mkfile.close
  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    matches = {}
    token_freq = Hash.new(0)
    tokens.each do |val|
      if good_token?(val)
        token_freq[val] +=1
      end
    end
    token_freq = token_freq.sort_by {|key, val| val}.reverse!
    token_freq = token_freq[0..129]
    token_freq.flatten!
    token_freq.delete_if {|x| x.is_a? Integer}

    @top_frequency.each do |key, val|
      compare = val & token_freq
      matches[key] = compare.length
    end
    mkfile = File.open("/home/daniel/code/algorithms/lib/txt/predict.txt","a")
    mkfile.write(matches)
    mkfile.close
    return matches.sort_by {|k,v| v}.reverse!.first[0]



  end
end

