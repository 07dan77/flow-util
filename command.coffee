commander   = require 'commander'
packageJSON = require './package.json'

class Command
  run: =>
    commander
      .version packageJSON.version
      .command 'pause',     'pause a flow'
      .command 'resume',    'resume a flow'
      .command 'save',      'save flow state'
      .command 'savepause', 'pause and save flow state'
      .parse process.argv

    unless commander.runningCommand
      commander.outputHelp()
      process.exit 1

module.exports = Command
