var BotRegistry = (function (exports) {

  var bots = {}

  exports.register = function (name, bot) {
    if (bots[name]) throw "Bot already exists with name `" + bot + "`";
    bots[name] = bot
  }

  exports.get = function (name) {
    if (!bots[name]) throw "Bot `" + name + "` does not exist.";
    return bots[name]
  }

  return exports
})(typeof module != "undefined" && module !== null && module.exports || {})
