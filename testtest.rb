


	def deal_card
		@cards.shift
	end

	def reset_dec
		@cards = []
	end

	# Reset this deck with 52 cards
	def create_52_card_deck
		ranks = (2..10).to_a + ["J", "Q", "K", "A"]
		values = (2..14).to_a
		suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
		ranks.each_index do |index|
			suits.each do |suit|
				@cards << Card.new(ranks[index], values[index], suit)
			end
		end
	end

end