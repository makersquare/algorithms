(function () {
  window.GameHistory = {}

  GameHistory.vm = {
    game: m.prop(null)
  }

  GameHistory.controller = function () {
    ctrl = {}
    // TODO (Eventually): Playback options
    return ctrl
  }
  GameHistory.view = function (ctrl) {
    var game = GameHistory.vm.game()
    return m('.game-history', [
      m('h2', game.p1.bot.name + " VS " + game.p2.bot.name),
      game.history.map(roundView),
      playerStats(game)
    ])
  }


  function roundView (moves) {
    return m('.round', moves.map(function(move) {
      return m('.move', { "class": move.result }, [
        move.played.map(function(card) {
          return m('.card', { "class": card.type }, cardText(card))
        })
      ])
    }))
  }

  function cardText (card) {
    return (card.name || card.value) + " of " + card.suit
  }

  function playerStats (game) {
    var winner
    if (game.winner) {
      winner = m('h2', game.winner.bot.name + " Wins!")
    }
    else {
      winner = m('h2', "It's a.. tie?")
    }
    return [
      winner,
      m('.round', [game.p1, game.p2].map(function(player) {
        return m('.move', [
          m('h3', player.bot.name),
          m('label', "Score: "),
          player.score,
          m('br'),
          m('label', "Deck size: "),
          player.deck.length
        ])
      }))
    ]
  }
})()
