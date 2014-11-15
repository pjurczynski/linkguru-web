Reflux = require 'reflux'
Window.Actions = require('./actions')
Window.Stores = require('./stores')

React = require 'react'
Router = require './router'

Router.start()
Window.Actions.links.fetch()
