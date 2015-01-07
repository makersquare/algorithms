(function () {

  var botName = 'reckless-bot'

  var BotClass = function () {
    // <<Initialize bot state here>>

    return {
      name: botName,
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
  }

  BotClass.botName = botName
  registerBot(botName, BotClass)
})()
