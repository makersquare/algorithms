(function () {

  var bot = {
    name: 'dummy-bot',
    play: function (drawnCard, remainingDeckSize, moveType) {
      // moveType will be either 'normal', 'war', 'normal-gamble', or 'war-gamble'
      return 'accept'
    },
    handleRoundResult: function (didIWin, loot) {
      // TODO: Whatever you want. You can do aanything
    }
  }

  registerBot(bot)
})()
