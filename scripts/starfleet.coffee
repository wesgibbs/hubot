# Description
#   Augment images with the Starship Enterprise or Geordi's visor.
#
# Dependencies:
#
# Configuration:
#
# Commands:
#   starfleet me [visor] <url>   - Adds some Starfleet accoutrement to the specified URL.
#   starfleet me [visor] <query> - Searches Google Images for the specified query and
#                       adds some Starfleet accoutrement to it.
#
# Author:
#   wgibbs
module.exports = (robot) ->
  robot.respond /starfleet me (visor)?(.*)/i, (msg) ->
    visor = if msg.match[1] == 'visor' then 'visor' else ''
    starfleetify = "http://starfleet-me.herokuapp.com/#{visor}?source="
    imagery = msg.match[2]

    if imagery.match /^https?:\/\//i
      msg.send "#{starfleetify}#{imagery}"
    else
      imageMe msg, imagery, (url) ->
        msg.send "#{starfleetify}#{url}"

imageMe = (msg, query, cb) ->
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(v: "1.0", rsz: '8', q: query, safe: 'active')
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData.results
      if images.length > 0
        image  = msg.random images
        cb "#{image.unescapedUrl}#.png"
