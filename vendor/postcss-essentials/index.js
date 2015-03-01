var postcss = require('postcss');
var simpleVars = require('postcss-simple-vars');
var postcssImport = require('postcss-import');
var mixins = require('postcss-mixins');
var nested = require('postcss-nested');
var colorFunctions = require('postcss-color-function');

module.exports = function(css, opts) {
  var processors = [
    postcssImport({ from: opts.from }),
    mixins,
    nested,
    simpleVars,
    colorFunctions()
  ]

  return postcss(processors).process(css, opts);
}
