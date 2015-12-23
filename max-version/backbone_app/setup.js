var $ = require('jquery-browserify');
var Backbone = require('backbone');
Backbone.$ = $;
var Marionette = require('backbone.marionette');

Backbone.Marionette = Marionette;

// Get the Deferred creator for later use

window.Backbone = Backbone;

module.exports = Backbone;
