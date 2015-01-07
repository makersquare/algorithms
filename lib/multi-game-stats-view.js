(function () {

  window.MultiGameStats = {}

  MultiGameStats.vm = {
    bots: {
      p1: null,
      p2: null,
    },
    winCounts: m.prop(null)
  }

  MultiGameStats.controller = function () {}

  MultiGameStats.view = function (ctrl) {
    var bots = MultiGameStats.vm.bots
    var winCounts = MultiGameStats.vm.winCounts()

    var winner = getWinner(winCounts)

    if (winner) {
      winnerText = m('h1', bots[winner].botName + " Wins!")
    }
    else {
      winnerText = m('h1', "It's a.. tie?")
    }
    return [
      m('h2', bots.p1.botName + " VS " + bots.p2.botName),
      winnerText,
      m('.round', ['p1', 'p2'].map(function(player) {
        return m('.move', [
          m('h3', bots[player].botName),
          m('label', "Game win count: "),
          winCounts[player]
        ])
      }))
    ]
  }

  function getWinner(winCounts) {
    if (winCounts.p1 > winCounts.p2) {
      return 'p1'
    }
    else if (winCounts.p1 < winCounts.p2) {
      return 'p2'
    }
    else {
      return null
    }
  }
})()
