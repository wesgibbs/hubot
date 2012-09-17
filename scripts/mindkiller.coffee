# Description:
#   Abolish all fear from your chat room. Hubot will calm those in peril with a
#   recitation of the Litany Against Fear.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   i|you fear - Recite the litany
#   i|you am|are afraid - recite the litany
#
# Authors:
#   wgibbs

litany = "I must not fear.\n
Fear is the mind-killer.\n
Fear is the little-death that brings total obliteration.\n
I will face my fear.\n
I will permit it to pass over me and through me.\n
And when it has gone past I will turn the inner eye to see its path.\n
Where the fear has gone there will be nothing.\n
Only I will remain."

module.exports = (robot) ->
  robot.hear /(i('m| am)?|you(|'re| are)) (\w* )?(afraid|fear)/i, (msg) ->
    msg.send litany
