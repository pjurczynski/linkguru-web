Reflux = require 'reflux'

actions =
  links: Reflux.createActions([
    'add',
    'remove',
    'upVote',
    'downVote',
    'update',
    'search',
    'fetch'
  ])
  tags: Reflux.createActions([
    'select',
  ])

  session: Reflux.createActions([
    'login',
    'logout'
  ])

module.exports = actions
