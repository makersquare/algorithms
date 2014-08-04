require_relative 'predictor'

class ComplexPredictor < Predictor

  def train!

    # take each book array.inject(Hash.new(0)) { |h, k| h[k] += 1, h}

    @archwords = []

    (0..(@all_books[:archeology].length - 1)).each do |num|
      @all_books[:archeology][num][1].each do |word|
        @archwords << word if good_token?(word) == true
      end
    end

    archhash = {}

    @archwords.each do |word|
      if archhash[word] == nil
        archhash[word] = 1
      else
        archhash[word] += 1
      end
    end

    newarchhash = archhash.sort_by{|key, value| value}.reverse[0..60]

    @archarr = []
    newarchhash.each { |k,v| @archarr << k }
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    @astrowords = []
    (0..(@all_books[:astronomy].length - 1)).each do |num|
      @all_books[:astronomy][num][1].each do |word|
        @astrowords << word if good_token?(word) == true
      end
    end

    astrohash = {}

    @astrowords.each do |word|
      if astrohash[word] == nil
        astrohash[word] = 1
      else
        astrohash[word] += 1
      end
    end
    
    newastrohash = astrohash.sort_by{|key, value| value}.reverse[0..60]

    @astroarr = []
    newastrohash.each { |k,v| @astroarr << k }

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    @philwords = []
    (0..(@all_books[:philosophy].length - 1)).each do |num|
      @all_books[:philosophy][num][1].each do |word|
        @philwords << word if good_token?(word) == true
      end
    end

    philhash = {}

    @philwords.each do |word|
      if philhash[word] == nil
        philhash[word] = 1
      else
        philhash[word] += 1
      end
    end

    newphilhash = philhash.sort_by{|key, value| value}.reverse[0..60]

    @philarr = []
    newphilhash.each { |k,v| @philarr << k }

#-----------------------------

    @relwords = []
    (0..(@all_books[:religion].length - 1)).each do |num|
      @all_books[:religion][num][1].each do |word|
        @relwords << word if good_token?(word) == true
      end
    end

    relhash = {}

    @relwords.each do |word|
      if relhash[word] == nil
        relhash[word] = 1
      else
        relhash[word] += 1
      end
    end

    newrelhash = relhash.sort_by{|key, value| value}.reverse[0..60]


    @relarr = []
    newrelhash.each { |k,v| @relarr << k }

  end 

  def predict(tokens)
    @goodtokens = []
    tokens.each do |word|
      @goodtokens << word if good_token?(word) == true
    end
    testhash = {}
    @goodtokens.each do |word|
      if testhash[word] == nil
        testhash[word] = 1
      else
        testhash[word] += 1
      end
    end
    

      newtesthash = testhash.sort_by{|key, value| value}.reverse[0..60]
      @bookarr = []
      newtesthash.each { |k,v| @bookarr << k }

      philscore = 0
      
      (0..@philarr.length - 1).each do |num|
        @bookarr.each do |word|
          philscore += 1 if word == @philarr[num]
        end
      end


    astroscore = 0
  
    (0..@astroarr.length - 1).each do |num|
      @bookarr.each do |word|
        astroscore += 1 if word == @astroarr[num]
      end
    end


    archscore = 0
    (0..@archarr.length - 1).each do |num|
      @bookarr.each do |word|
        archscore += 1 if word == @archarr[num]
      end
    end

    relscore = 0

    (0..@relarr.length - 1).each do |num|
      @bookarr.each do |word|
        relscore += 1 if word == @relarr[num]
      end
    end

    scores = [philscore, astroscore, archscore, relscore]
    case 
      when scores.max == philscore
        return :philosophy
      when scores.max == astroscore
        return :astronomy
      when scores.max == archscore
        return :archeology
      when scores.max == relscore
        return :religion
    end  


  end 

end
