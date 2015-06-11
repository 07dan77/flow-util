commander     = require 'commander'
MeshbluConfig = require 'meshblu-config'
path          = require 'path'
request       = require 'request'

class CommandResume
  parseOptions: =>
    commander
      .usage '[options] [path/to/meshblu.json]'
      .description 'uses MESHBLU_UUID and MESHBLU_TOKEN from the environment'
      .parse process.argv

    @filename = commander.args[0]

  run: =>
    @parseOptions()

    meshblu = new MeshbluConfig filename: @filename
    config = meshblu.toJSON()

    url = "https://flow-deploy.octoblu.com/flows/#{config.uuid}/instance/resume"
    requestOptions =
      auth:
        user: config.uuid
        pass: config.token

    request.post url, requestOptions, (error, response, body) =>
      return @printErrorAndDie error if error?
      return @printErrorAndDie new Error(body.error) if response.statusCode != 201
      console.log JSON.stringify(body, null, 2)

  printErrorAndDie: (error) =>
    console.error error.message
    console.error error.stack if error.stack?
    process.exit 1

module.exports = CommandResume
