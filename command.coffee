commander   = require 'commander'
packageJSON = require './package.json'

class Command
  run: =>
    commander
      .version packageJSON.version
      .command 'resume',    'resume a flows'
      .command 'savepause', 'pause and save a flow'
      .parse process.argv

    unless commander.runningCommand
      commander.outputHelp()
      process.exit 1

module.exports = Command
