(function () {

  var bots = {}

  window.registerBot = function (bot) {
    if (!bot.name) throw "Bot does not have a name property";
    if (bots[bot.name]) throw "Bot already exists with name `" + bot + "`";
    bots[bot.name] = bot
  }

  window.getRegisteredBot = function (name) {
    if (!bots[name]) throw "Bot `" + name + "` does not exist.";
    return bots[name]
  }
})()
