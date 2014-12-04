var LinkedList = require("./linkedList");

module.exports = (function() {
  var ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'];
  var suits = ["Spades", "Clubs", "Hearts", "Diamonds"];
  
  var War = function() {
    this.deck = War.createNewDeck();

    this.player1 = {
      deck: War.createNewDeck()
    };

    this.player2 = {
      deck: War.createNewDeck()
    };
  };

  War.createNewDeck = function() {
    return new LinkedList();
  };

  War.prototype.initializeDeck = function() {
    for (var i = 0; i < suits.length; i++) {
      for (var j = 0; j < ranks.length; j++) {
        this.deck.push({
          rank: ranks[j],
          suit: suits[i]
        });
      }
    }
  };

  War.prototype.passOutCards = function() {
    while (this.deck.length > 0) {
      this.player1.deck.push(this.deck.shift());
      this.player2.deck.push(this.deck.shift());
    }
  };

  War.prototype.playOneRound = function() {
    var card1 = this.player1.deck.shift();
    var card2 = this.player2.deck.shift();
    if (ranks.indexOf(card1.rank) > ranks.indexOf(card2.rank)) {
      this.player1.deck.push(card1);
      this.player1.deck.push(card2);
    } else if (ranks.indexOf(card1.rank) < ranks.indexOf(card2.rank)) {
      this.player2.deck.push(card2);
      this.player2.deck.push(card1);
    } else {
      this.player1.deck.push(card1);
      this.player1.deck.push(card2);
    }
  };

  War.prototype.playGame = function() {
    while(this.player1.deck.length > 0 && this.player2.deck.length > 0) {
      this.playOneRound();
    }
  };
  
  return War;
})();
