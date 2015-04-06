Reflux = require 'reflux'

linksStore = require('./stores/links')
sessionStore = require('./stores/session')

stores =
  session: sessionStore
  links: linksStore
  tags: require('./stores/tags').agregate(linksStore)

module.exports = stores
