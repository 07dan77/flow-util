#!/usr/bin/env node

require('coffee-script/register');
var CommandSavePause = require('./command-savepause.coffee');

if(require.main == module){
  (new CommandSavePause()).run();
} else {
  module.exports = CommandSavePause;
}
