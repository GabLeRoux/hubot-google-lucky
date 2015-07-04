# Description
#   A hubot script that returns I'm feeling lucky's Google result
#
# Configuration:
#
# Commands:
#   hubot luck <query> - Get a lucky link from google
#   hubot lucky me <query> - Get a lucky link from google
#   hubot feeling lucky for <query> - Get a lucky link from google
#
# Notes:
#
# Author:
#   Gabriel Le Breton <lebreton.gabriel@gmail.com>'

module.exports = (robot) ->
  robot.respond /(((luck|lucky)( me)?)|(feeling lucky for)) (.*)/i, (msg) ->
#    console.log msg.match
    first_request = "https://www.google.com/search?btnI=I%27m+Feeling+Lucky&q=#{encodeURIComponent(msg.match[6])}"

    robot.http(first_request)
    .get() (err, res, body) ->
      first_redirect = res.headers.location

      if first_redirect?
        robot.http(res.headers.location)
        .get() (err, res, body) ->
          second_redirect = res.headers.location # sometimes, you get redirected twice with google's I'm feeling lucky
          # and sometimes, it's actually the site redirecting you to a path, so let's make sure it starts with http :)
          if second_redirect? and second_redirect.startsWith "http"
            msg.reply second_redirect
          else
            msg.reply first_redirect

      else msg.reply first_request

  String::startsWith ?= (s) -> @slice(0, s.length) == s
