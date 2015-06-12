#!/usr/bin/env node

require('coffee-script/register');
var CommandPause = require('./command-pause.coffee');

if(require.main == module){
  (new CommandPause()).run();
} else {
  module.exports = CommandPause;
}
