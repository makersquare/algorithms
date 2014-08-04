require_relative 'predictor'

class ComplexPredictor < Predictor


  def build(category)

    length = @all_books[category].length - 1
    words_hash = Hash.new(0)

    for num in 0..length
      for word in @all_books[category][num][1]
        words_hash[word] += 1 if good_token?(word) == true
      end
    end
    
    return_array = []
    return_hash = words_hash.sort_by{|key, value| value}.reverse[0..200]
    return_hash.each { |k,v| return_array << k }
    return return_array
  end

  def score(tokens_list)
    score = 0
    length = tokens_list.length - 1 
    for num in 0..length
      @bookarr.each { 
        |word| score += 1 if word == tokens_list[num] }        
    end
    return score
  end

  def train!
    # take each book array.inject(Hash.new(0)) { |h, k| h[k] += 1, h}
    @archarr = build(:archeology)
    @astroarr = build(:astronomy)
    @philarr = build(:philosophy)
    @relarr = build(:religion)
  end 

  def predict(tokens)
    @goodtokens = []
    tokens.each do |word|
      @goodtokens << word if good_token?(word) == true
    end
    testhash = Hash.new(0)
    @goodtokens.each do |word|
      testhash[word] += 1
    end
    #argh

    newtesthash = testhash.sort_by{|key, value| value}.reverse[0..60]
    @bookarr = []
    newtesthash.each { |k,v| @bookarr << k }
# shoot flub
    scores = [score(@philarr), score(@astroarr), score(@archarr), score(@relarr)]
    case 
      when scores.max == scores.first
        return :philosophy
      when scores.max == scores[1]
        return :astronomy
      when scores.max == scores[2]
        return :archeology
      when scores.max == scores[3]
        return :religion
    end
# :(

  end 

end
