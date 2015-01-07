(function () {

  var bots = {}

  window.registerBot = function (name, bot) {
    if (bots[name]) throw "Bot already exists with name `" + bot + "`";
    bots[name] = bot
  }

  window.getRegisteredBot = function (name) {
    if (!bots[name]) throw "Bot `" + name + "` does not exist.";
    return bots[name]
  }
})()
