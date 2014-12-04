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
      expect(war.deck.shift()).not.toEqual(war.deck.shift());
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
        describe("player 2 wins", function() {
          beforeEach(function() {
            war.player1.deck = War.createNewDeck();
            war.player1.deck.push({rank: 5, suit: "Diamonds"});
            war.player1.deck.push({rank: 8, suit: "Spades"});

            war.player2.deck = War.createNewDeck();
            war.player2.deck.push({rank: 6, suit: "Diamonds"});
            war.player2.deck.push({rank: 10, suit: "Hearts"});

            war.playOneRound();
          });
          
          it("adds a card to the winner", function() {
            expect(war.player1.deck.length).toEqual(1);
            expect(war.player2.deck.length).toEqual(3);
            expect(war.player2.deck.shift()).toEqual({rank: 10, suit: "Hearts"});
            expect(war.player2.deck.shift()).toEqual({rank: 6, suit: "Diamonds"});
            expect(war.player2.deck.shift()).toEqual({rank: 5, suit: "Diamonds"});
            expect(war.player1.deck.shift()).toEqual({rank: 8, suit: "Spades"});
          });

          it("doesn't alter the front of the deck", function() {
            expect(war.player1.deck.shift()).toEqual({rank: 8, suit: "Spades"});
            expect(war.player2.deck.shift()).toEqual({rank: 10, suit: "Hearts"});
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
