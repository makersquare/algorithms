require_relative 'predictor'


class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!
    @data = {}

    @all_books.each do |category, books|
      @data[category] = {}
      books.each do |filename, tokens|
        tokens = tokens.select {|token| good_token?(token)}
        sorted_token_array = tokens.inject(Hash.new(0)) {|k, v| k[v] +=1 ; k }.sort_by {|k,v| v}.reverse.slice(0..100).flatten
        @data[category] = @data[category].merge(Hash[*sorted_token_array])
        # @data[category][:books] += 1
      end
    end
    puts @data
  end

# Public: Predicts category.
#
# tokens - A list of tokens (words).
#
# Returns a category.


def predict(tokens)

  # philosophy = %w(philosophy knowledge nature science experience world real nature substance reality individual actual distinct human mind plato principle intellect gutenberg project prior)
  # religion = %w(christ passion spirit heart praise heaven hell glory jesus luke mary holy scripture virtue lord thou thy great god faith man disciple psalm david king drink brazen israel psalms love men flesh sacrament words tithe paul john miracle)
  # astronomy = %w(star stars situated culminates color constellation line head sun day moon year time stars month sun earth page stars miles fig days star power)
  # archeology = %w(burial dead body indians feet bones dr time grave place house timbers work hogán houses doorway na ia small ditto tsa sá pa zuñi kiva pueblo village house stone wall walls built omaha)
  temp_array = []
  correct_category = nil
  result_array = []

  philosophy = @data[:philosophy]
  archeology = @data[:archeology]
  religion = @data[:religion]
  astronomy = @data[:astronomy]



  categories = [archeology, astronomy, philosophy, religion]
  categories.each do |category|
    result_array = []
    tokens[300..-100].each do |token| 
      if category[token] 
        result_array << true
      end
    end
    correct_category = category if result_array.count(true) > temp_array.count(true)
    temp_array = result_array if result_array.count(true) > temp_array.count(true)
    puts result_array.count(true)
  end
  # categories.each do |category|
  #   # temp_array = result_array
  #   result_array = []

  #   category.each do |word|
  #     result = tokens.include?(word)
  #     result_array << result
  #     correct_category = category if result_array.count(true) > temp_array.count(true)
  #     temp_array = result_array if result_array.count(true) > temp_array.count(true)
  #   end
    
    # puts result_array.count(true)
  # end

  return :philosophy if correct_category == philosophy
  return :religion if correct_category == religion
  return :astronomy if correct_category == astronomy
  return :archeology if correct_category == archeology
  # Always predict astronomy, for now.
  # :astronomy
end
end
# ComplexPredictor.predict(['brutal', 'spirit', 'praise'])