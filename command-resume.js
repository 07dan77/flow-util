#!/usr/bin/env node

require('coffee-script/register');
var CommandResume = require('./command-resume.coffee');

if(require.main == module){
  (new CommandResume()).run();
} else {
  module.exports = CommandResume;
}
