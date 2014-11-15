Reflux = require 'reflux'

linksStore = require('./stores/links')

stores =
  links: linksStore
  tags: require('./stores/tags').agregate(linksStore)

module.exports = stores
