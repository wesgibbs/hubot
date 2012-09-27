# Description
#   Puts your text at the top of the "Blame it on the tailbrain" stegosaurus.
#
# Dependencies:
#
# Configuration:
#
# Commands:
#   tailbrain <text> - Blame your silly mistakes on your tail brain.
#
# Author:
#   wgibbs
module.exports = (robot) ->
  robot.respond /tailbrain (.*)/i, (msg) ->
    msg.http("http://tailbrain.herokuapp.com/generate")
      .headers(Accept: 'application/json')
      .query(text: msg.match[1])
      .get() (err, res, body) ->
        parsed_body = JSON.parse(body)
        msg.send(parsed_body.image)
