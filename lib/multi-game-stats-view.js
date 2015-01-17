(function () {

  window.MultiGameStats = {}

  MultiGameStats.vm = {
    bots: {
      p1: null,
      p2: null,
    },
    winCounts: m.prop(null),
    matchIsOver: m.prop(false),
    matchInProgress: m.prop(false)
  }

  MultiGameStats.controller = function () {
    this.start = function () {
      MultiGameStats.vm.matchInProgress(true)
      MultiGameStats.playMatch()
    }
  }

  MultiGameStats.view = function (ctrl) {
    var vm = MultiGameStats.vm
    var bots = vm.bots
    var winCounts = vm.winCounts()

    var winnerText = ''
    if (vm.matchIsOver()) {
      var winner = getWinner(winCounts)
      if (winner) winnerText = m('h1', bots[winner].botName + " Wins!")
      else winnerText = m('h1', "It's a.. tie?")
    }
    return [
      m('h2', winnerText || (bots.p1.botName + " VS " + bots.p2.botName)),
      m('.start', [
        m('button.start', { onclick: ctrl.start },  "START")
      ]),
      m('.round', ['p1', 'p2'].map(function(player) {
        return m('.move', [
          m('h3', bots[player].botName),
          m('label', "Game win count: "),
          m('br'),
          m('.win-count', { "class": isPlayerWinning(player) ? 'winning' : '' }, winCounts[player])
        ])
      }))
    ]

    function isPlayerWinning (player) {
      var winner = vm.winCounts()
      var other = (player === 'p1') ? 'p2' : 'p1'
      return winCounts[player] > winner[other]
    }
  }

  function startButton (ctrl) {
    if (! MultiGameStats.vm.matchInProgress()) return;
    return m('.start', [
      m('button.start', { onclick: MultiGameStats.playMatch },  "START")
    ])
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
