# Description:
#   Display an appropriate working-from-home photo.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   wfh - Display a working-from-home photo.
#   working from home - Display a working-from-home photo.
#
# Authors:
#   wgibbs

module.exports = (robot) ->
  robot.hear /(wfh|working from home)/i, (msg) ->
    index = Math.floor(Math.random() * 6) + 1
    msg.send "http://i191.photobucket.com/albums/z191/wgibbs/wfh/#{index}.jpg"
