let func = {};

/**
 * This funciton return a message for you.
 * @param {String} expr like your name
 */
func.coucou = function (expr = "World") {
  return "Hello " + expr + " !";
};

/**
 * Colorize the string
 * @param {String} expr
 */
func.colorize = function (expr) {
  return "\x1b[35m\x1b[40m" + expr + "\x1b[0m";
};

module.exports = func;
