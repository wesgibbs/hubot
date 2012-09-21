# Description:
#   Brighten your day with a little dash of Tom Hiddleston
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot hiddles me - Shows a random picture of actor Tom Hiddleston
#
# Authors:
#   wgibbs

module.exports = (robot) ->
  robot.respond /hiddles me/i, (msg) ->
    imageMe msg, 'Tom Hiddleston', (url) ->
      msg.send url

imageMe = (msg, query, cb) ->
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(v: "1.0", rsz: '8', q: query, safe: 'active')
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData.results
      if images.length > 0
        image  = msg.random images
        cb "#{image.unescapedUrl}#.png"
