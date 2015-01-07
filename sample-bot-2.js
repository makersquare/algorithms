(function () {

  var bot = {
    name: 'reckless-bot',
    play: function (drawnCard, remainingDeckSize, moveType) {
      // moveType will be either 'normal', 'war', 'normal-gamble', or 'war-gamble'
      if (moveType === 'normal' || moveType === 'war') {
        return 'gamble'
      }
      else {
        return 'accept'
      }
    },
    handleRoundResult: function (didIWin, loot) {
      // TODO: Whatever you want. You can do aanything
    }
  }

  registerBot(bot)
})()
