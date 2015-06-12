#!/usr/bin/env node

require('coffee-script/register');
var CommandSave = require('./command-save.coffee');

if(require.main == module){
  (new CommandSave()).run();
} else {
  module.exports = CommandSave;
}
