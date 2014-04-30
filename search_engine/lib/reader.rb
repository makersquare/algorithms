module Reader

  STOP_WORDS = Set.new(File.read('data/stopwords.txt').split(',')) # Constant containing stop words

  def read_all_books(folder)
    books = {}
    Find.find("data/#{folder}") do |file|
      next if File.directory?(file)
      next if file.split("/").last[0] == "." # Ignore hidden files

      content = read_book(File.read(file))
      books[file.split("/").last] = content
    end
    books
  end

  def read_book(string)
    require 'iconv' unless String.method_defined?(:encode)
    if String.method_defined?(:encode)
      string.encode!('UTF-8', 'UTF-8', :invalid => :replace, :undef => :replace)
    else
      ic = Iconv.new('UTF-8', 'UTF-8//IGNORE')
      string = ic.iconv(string)
    end

    res = []
    string.split(/\W+/).map(&:downcase).each do |word| # Split by non-words
      res << word unless STOP_WORDS.include?(word) # Only add the word if it isn't a stop word
    end
    res
  end

end
