var BotJoust = (function (exports) {

  var unshift = Array.prototype.unshift

  exports.playGame = function (Bot1, Bot2) {
    var game = Game()
    var bot1 = game.p1.bot = new Bot1()
    var bot2 = game.p2.bot = new Bot2()

    while (true) {
      var move1 = play(game.p1, bot1, Move(bot1), 'normal')
      var move2 = play(game.p2, bot2, Move(bot2), 'normal')

      var winner = checkForLoser(move1, move2)
      if (winner) {
        if (winner !== 'tie') game.winner = game[winner]
        return game
      }

      var roundWinner;
      do {

        roundWinner = determineRoundWinner(move1, move2)
        if (roundWinner === 'tie') {
          move1 = play(game.p1, bot1, move1, 'war')
          move2 = play(game.p2, bot2, move2, 'war')
          var winner = checkForLoser(move1, move2)
          if (winner) {
            if (winner !== 'tie') game.winner = game[winner]
            return game
          }
        }

      } while (roundWinner === 'tie')

      game[roundWinner].score += 1

      // Shuffle loot into winner's deck
      var loot = move1.cards.concat(move2.cards)
      shuffle(loot)
      unshift.apply(game[roundWinner].deck, loot)

      // Give detailed information about loot to each bot
      var lootInfo1 = move1.played.map(withOwnership).concat(move2.played)
      var lootInfo2 = move1.played.concat(move2.played.map(withOwnership))
      bot1.handleRoundResult(roundWinner === 'p1', lootInfo1)
      bot2.handleRoundResult(roundWinner === 'p2', lootInfo2)

      game.history.push([move1, move2])

      var winner = checkForWinner(game)
      if (winner) {
        game.winner = game[winner]
        return game
      }
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

  function Move (playerName) {
    return { cards: [], played: [], playerName: playerName }
  }

  function play (player, bot, move, type) {
    var potCard
    if (type === 'war') {
      move.played.last().type = 'conflict'

      ;[1,2,3].forEach(function () {
        potCard = player.deck.pop()
        move.cards.push(potCard)
        move.played.push(extend({ type: 'loot' }, potCard))
      })
    }
    if (player.deck.length === 0) return OutOfCardsError(player)

    var nextCard = player.deck.pop()
    move.cards.push(nextCard)

    var action = bot.play(move.cards.last(), player.deck.length, type)
    if (action === 'gamble') {
      if (player.deck.length === 0) return OutOfCardsError(player)

      // Record the card that they gambled
      move.played.push(extend({ type: 'gamble' }, nextCard))

      // Push extra card they don't know about
      potCard = player.deck.pop()
      move.cards.push(potCard)
      move.played.push(extend({ type: 'loot' }, potCard))

      if (player.deck.length === 0) return OutOfCardsError(player)

      // Push the next card they will deal with
      nextCard = player.deck.pop()
      move.cards.push(nextCard)

      // Request another action
      action = bot.play(move.cards.last(), player.deck.length, type+'-gamble')
    }

    if (action === 'accept') {
      move.played.push(extend({ type: 'play' }, nextCard))
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
      p1move.result = 'win'
      p2move.result = 'lose'
      return 'p1'
    }
    else if (p1card.value < p2card.value) {
      p1move.result = 'lose'
      p2move.result = 'win'
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

  function extend(target, source) {
    for (var prop in source) {
      target[prop] = source[prop]
    }
    return target
  }

  function withOwnership(card) {
    return extend({ isMine: true }, card)
  }

  // Monkey-patch (don't try this at home)
  Object.defineProperty(Array.prototype, 'last', {
    enumerable: false,
    configurable: false,
    writable: false,
    value: function () { return this[this.length-1] }
  })

  return exports
})(typeof module != "undefined" && module !== null && module.exports || {})
