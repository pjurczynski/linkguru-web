Reflux = require 'reflux'

actions =
  links: Reflux.createActions([
          "add",
          "remove",
          "upVote",
          "downVote",
          "update",
          "fetch"
        ])

module.exports = actions
