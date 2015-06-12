commander     = require 'commander'
MeshbluConfig = require 'meshblu-config'
path          = require 'path'
request       = require 'request'

FLOW_DEPLOY_SERVICE_BASE_URI = process.env.FLOW_DEPLOY_SERVICE_BASE_URI ? 'https://flow-deploy.octoblu.com'

class CommandPause
  parseOptions: =>
    commander
      .usage '[options] [path/to/meshblu.json]'
      .description 'config parameters may optionally be provided by the environment'
      .parse process.argv

    @filename = commander.args[0]

  run: =>
    @parseOptions()

    meshblu = new MeshbluConfig filename: @filename
    config = meshblu.toJSON()

    url = "#{FLOW_DEPLOY_SERVICE_BASE_URI}/flows/#{config.uuid}/instance/pause"
    requestOptions =
      auth:
        user: config.uuid
        pass: config.token

    request.post url, requestOptions, (error, response, body) =>
      return @printErrorAndDie error if error?
      return @printErrorAndDie new Error(body.error) if response.statusCode != 201

  printErrorAndDie: (error) =>
    console.error error.message
    console.error error.stack if error.stack?
    process.exit 1

module.exports = CommandPause
