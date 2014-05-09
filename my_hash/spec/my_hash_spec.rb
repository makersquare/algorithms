require 'rubygems'
require 'rspec'
require 'pry-debugger'
require_relative '../my_hash.rb'

describe "MyHash" do
  before(:all) do
    @hash = MyHash.new
  end
  describe "#find_index" do
    it "should return an index that is between 0 and 64 and it stays the same" do
      expect(@hash.find_index("hello") >= 0).to eq(true)
      expect(@hash.find_index("hello") < 64).to eq(true)
      expect(@hash.find_index("hello")).to eq(@hash.find_index("hello"))
      expect(@hash.find_index("bye") >= 0).to eq(true)
      expect(@hash.find_index("bye") < 64).to eq(true)
      expect(@hash.find_index("bye")).to eq(@hash.find_index("bye"))
    end
  end

  describe "#[] and []=" do

    before(:all) do
      @first_elem = "John"
      n = 0

      while (@hash.find_index(@first_elem) != @hash.find_index("#{@first_elem} #{n}"))
        n += 1
      end
      @second_elem = "#{@first_elem} #{n}"

    end

    it "should not find an element that you didn't put in" do
      expect(@hash["hello"]).to eq (nil)
      expect(@hash["bye"]).to eq (nil)

      @hash[@first_elem] = "it is here"
      expect(@hash[@second_elem]).to eq(nil)
    end

    it "should not find an element that you didn't put in despite index" do
      @hash[@first_elem] = "it is here"
      expect(@hash[@second_elem]).to eq(nil)
    end

    it "should find elements that you did put in" do
      @hash["hello"] = "hey"
      @hash["bye"] = "good bye"
      expect(@hash["hello"]).to eq("hey")
      expect(@hash["bye"]).to eq("good bye")
    end

    it "should allow objects with same index to both be stored" do
      @hash[@first_elem] = 30
      @hash[@second_elem] = 50

      expect(@hash[@first_elem]).to eq(30)
      expect(@hash[@second_elem]).to eq(50)

      @hash[@first_elem] += 5
      @hash[@second_elem] += 10

      expect(@hash[@first_elem]).to eq(35)
      expect(@hash[@second_elem]).to eq(60)
    end

    it "should allow more than 64 key value pairs to be inserted" do
      128.times do |x|
        @hash["key#{x}"] = "value#{x}"
      end

      128.times do |x|
        expect(@hash["key#{x}"]).to eq("value#{x}")
      end
    end
  end

end
