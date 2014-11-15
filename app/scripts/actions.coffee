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
  tags: Reflux.createActions([
          "select",
        ])

module.exports = actions
