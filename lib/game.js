(function () {

  var unshift = Array.prototype.unshift

  window.playGame = function (bot1, bot2) {
    var game = Game()

    while (true) {
      var move1 = play(game.p1, bot1, { cards: [] }, 'normal')
      var move2 = play(game.p2, bot2, { cards: [] }, 'normal')

      var loser = checkForLoser(move1, move2)
      if (loser) {
        game.winner = (loser === 'p1') ? 'p2' : 'p1'
        return game
      }

      var roundWinner;
      do {

        roundWinner = determineRoundWinner(move1, move2)
        if (roundWinner === 'tie') {
          console.log("TIE:", move1.cards.last(), move2.cards.last())
          move1 = play(game.p1, bot1, move1, 'war')
          move2 = play(game.p2, bot2, move2, 'war')
          var loser = checkForLoser(move1, move2)
          if (loser) {
            game.winner = (loser === 'p1') ? 'p2' : 'p1'
            return game
          }
        }

      } while (roundWinner === 'tie')

      console.log("Round goes to:", roundWinner)
      game[roundWinner].score += 1

      var loot = move1.cards.concat(move2.cards)
      shuffle(loot)
      unshift.apply(game[roundWinner].deck, loot)

      game.history.push([move1, move2])

      game.winner = checkForWinner(game)
      if (game.winner) { return game }
    }
  }

  function Deck (suit1, suit2) {
    var cards = [suit1, suit2].map(function (suit) {
      return [
        { suit: suit, value: 2 },
        { suit: suit, value: 3 },
        { suit: suit, value: 4 },
        { suit: suit, value: 5 },
        { suit: suit, value: 6 },
        { suit: suit, value: 7 },
        { suit: suit, value: 8 },
        { suit: suit, value: 9 },
        { suit: suit, value: 10 },
        { name: 'Jack', suit: suit, value: 11 },
        { name: 'Queen', suit: suit, value: 12 },
        { name: 'King', suit: suit, value: 13 },
        { name: 'Ace', suit: suit, value: 14 }
      ]
    })
    return cards[0].concat(cards[1])
  }

  function Game () {
    return {
      history: [],
      p1: {
        name: 'p1',
        score: 0,
        deck: shuffle(Deck('hearts', 'clubs'))
      },
      p2: {
        name: 'p2',
        score: 0,
        deck: shuffle(Deck('diamonds', 'spades'))
      }
    }
  }

  function play (player, bot, move, type) {
    console.log("Playing", player, move, type)
    if (type === 'war') {
      move.cards.push(player.deck.pop())
      move.cards.push(player.deck.pop())
      move.cards.push(player.deck.pop())
    }
    if (player.deck.length === 0) return OutOfCardsError(player)

    move.cards.push(player.deck.pop())

    var action = bot.play(move.cards.last(), player.deck.length, type)
    if (action === 'gamble') {
      console.log(player.name, " be gamblin'")
      if (player.deck.length === 0) return OutOfCardsError(player)

      // Push extra card they don't know about
      move.cards.push(player.deck.pop())
      if (player.deck.length === 0) return OutOfCardsError(player)

      // Push the next card they will deal with
      move.cards.push(player.deck.pop())

      // Request another action
      action = bot.play(move.cards.last(), player.deck.length, type+'-gamble')
    }

    if (action === 'accept') {
      return move
    }
    // If we get here, then bot is misbehaving
    var error;
    if (action === 'gamble') {
      error = bot.name + ": you cannot gamble more than once per turn."
    }
    else {
      error = "Invalid action for " + bot.name + ": " + action
    }
    alert(error)
    throw error
  }


  function determineRoundWinner(p1move, p2move) {
    var p1card = p1move.cards.last()
      , p2card = p2move.cards.last()
    if (p1card.value > p2card.value) {
      return 'p1'
    }
    else if (p1card.value < p2card.value) {
      return 'p2'
    }
    else {
      // A war has happened
      return 'tie'
    }
  }

  function checkForWinner(game) {
    if (game.p1.score >= 40) {
      return 'p1'
    }
    else if (game.p2.score >= 40) {
      return 'p2'
    }
  }
  function checkForLoser(move1, move2) {
    if (move1.error && move2.error) {
      return 'tie'
    }
    else if (move1.error) {
      return 'p2'
    }
    else if (move2.error) {
      return 'p1'
    }
  }


  function OutOfCardsError (player) {
    return { player: player, error: 'ooc' }
  }

  //+ Jonas Raoni Soares Silva
  //@ http://jsfromhell.com/array/shuffle [v1.0]
  function shuffle(o){ //v1.0
      for(var j, x, i = o.length; i; j = Math.floor(Math.random() * i), x = o[--i], o[i] = o[j], o[j] = x);
      return o;
  }

  // Monkey-patch (don't try this at home)
  Object.defineProperty(Array.prototype, 'last', {
    enumerable: false,
    configurable: false,
    writable: false,
    value: function () { return this[this.length-1] }
  })
})()
