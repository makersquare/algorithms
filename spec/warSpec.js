var War = require('../war');

describe("War", function(){
  var war;

  beforeEach(function() {
    war = new War();
  });

  it("is created with a deck and 2 players", function() {
    expect(war.deck.length).toEqual(0);
    expect(war.player1).not.toBeUndefined();
    expect(war.player2).not.toBeUndefined();
  });

  describe("deck is initialized", function() {
    beforeEach(function() {
      war.initializeDeck();
    });

    it("has 52 cards", function() {
      expect(war.deck.length).toEqual(52);
    });

    it("initializes with different cards", function() {
      var card1 = {
        suit: "Hearts",
        rank: "J"
      };
      var card2 = {
        suit: "Spades",
        rank: 10
      };

      expect(war.deck).toContain(card1);
      expect(war.deck).toContain(card2);
    });

    describe("cards are passed out", function() {
      beforeEach(function() {
        war.passOutCards();
      });

      it("passes out 26 cards to each player", function() {
        expect(war.player1.deck.length).toEqual(26);
        expect(war.player2.deck.length).toEqual(26);
      });

      it("empties out existing deck", function() {
        expect(war.deck.length).toEqual(0);
      });

      describe("play one round", function() {
        describe("player 1 wins", function() {
          beforeEach(function() {
            war.player1.deck = [
              {rank: 5, suit: "Diamonds"},
              {rank: 8, suit: "Spades"}
            ];
            war.player2.deck = [
              {rank: 6, suit: "Diamonds"},
              {rank: 10, suit: "Hearts"}
            ];
            war.playOneRound();
          });
          
          it("adds a card to the winner", function() {
            expect(war.player1.deck.length).toEqual(1);
            expect(war.player2.deck.length).toEqual(3);
            expect(war.player2.deck).toContain({rank: 6, suit: "Diamonds"});
            expect(war.player2.deck).toContain({rank: 10, suit: "Hearts"});
            expect(war.player2.deck).toContain({rank: 5, suit: "Diamonds"});
            expect(war.player1.deck).toContain({rank: 8, suit: "Spades"});
          });

          it("adds the card to the end of the deck", function() {
            expect(war.player1.deck[0]).toEqual({rank: 8, suit: "Spades"});
            expect(war.player2.deck[0]).toEqual({rank: 10, suit: "Hearts"});
          });
        });
      });

      describe("play game", function() {
        beforeEach(function() {
          war.passOutCards();
          war.playGame();
        });

        it("ends with all cards belonging to 1 player", function() {
          expect(war.player1.deck.length + war.player2.deck.length).toEqual(52);
          expect(war.player1.deck.length * war.player2.deck.length).toEqual(0);
        });
      });
    });
  });
});
