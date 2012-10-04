# Description:
#   Display the Oh You dog.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot oh you - Display the Oh You dog.
#
# Authors:
#   wgibbs

oh_you_dog_url = "http://i191.photobucket.com/albums/z191/wgibbs/Chloe_zps841c95e1.jpeg"

module.exports = (robot) ->
  robot.respond /oh you$/i, (msg) ->
    msg.send oh_you_dog_url
