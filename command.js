#!/usr/bin/env node

require('coffee-script/register');
var Command = require('./command.coffee');

if(require.main == module){
  (new Command()).run();
} else {
  module.exports = Command;
}
