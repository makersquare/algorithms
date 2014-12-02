console.log("hi");

// Data Structures declared here
var deck = [];
var moveCount = 0;

var player1 = {
  deck: []
};

var player2 = {
  deck: []
};

var initializeDeck = function() {
  console.log("Fill deck with 52 cards (each card is an object that has a rank and suit). Clear the players' decks.");
};

var shuffleCards = function() {
  console.log("Shuffle the deck of cards");
};

var passOutCards = function() {
  console.log("Pass out the deck of cards to the 2 players");
};

var playOneRound = function() {
  console.log("Play 1 round of war where each player takes out a card to battle!");
};

var declareWinner = function() {
  console.log("Print out who the winner of the game is and how many moves it took to win.");
};

// Main function that controls everything
var countTotalMovesInWar = function() {
  initializeDeck();
  shuffleCards();
  passOutCards();
  while(player1.deck.size > 0 && player2.deck.size > 0) {
    playOneRound();
  }
  declareWinner();
};

// Execute main function
countTotalMovesInWar();
