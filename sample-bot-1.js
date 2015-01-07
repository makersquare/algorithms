(function () {

  var botName = 'dummy-bot'

  var BotClass = function () {
    // <<Initialize bot state here>>

    return {
      name: botName,
      play: function (drawnCard, remainingDeckSize, moveType) {
        // moveType will be either 'normal', 'war', 'normal-gamble', or 'war-gamble'
        return 'accept'
      },
      handleRoundResult: function (didIWin, loot) {
        // TODO: Whatever you want. You can do aanything
      }
    }
  }

  BotClass.botName = botName
  registerBot(botName, BotClass)
})()
