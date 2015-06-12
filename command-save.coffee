commander     = require 'commander'
MeshbluConfig = require 'meshblu-config'
path          = require 'path'
request       = require 'request'
uuid          = require 'uuid'

FLOW_DEPLOY_SERVICE_BASE_URI = process.env.FLOW_DEPLOY_SERVICE_BASE_URI ? 'https://flow-deploy.octoblu.com'

class CommandSave
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

    url = "#{FLOW_DEPLOY_SERVICE_BASE_URI}/flows/#{config.uuid}/instance/save/#{uuid.v1()}"
    requestOptions =
      json: true
      auth:
        user: config.uuid
        pass: config.token

    request.post url, requestOptions, (error, response, body) =>
      return @printErrorAndDie error if error?
      return @printAndDie body if response.statusCode != 201

  printErrorAndDie: (error) =>
    console.error error.message
    console.error error.stack if error.stack?
    process.exit 1

  printAndDie: (something) =>
    console.error JSON.stringify(something, null, 2)
    process.exit 1


module.exports = CommandSave
