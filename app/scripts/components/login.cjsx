React = require "react"
Reflux = require "reflux"

session = Window.Actions.session
sessionStore = Window.Stores.session
panel = require("react-bootstrap/lib/panel")

{ State, Navigation } = require "react-router"

Login = React.createClass
  mixins: [Reflux.listenTo(sessionStore, "onSessionStateChange"), Navigation, State]

  onLoginClick: ->
    session.login()

  onSessionStateChange: (session) ->
    nextPath = @getQuery().nextPath || 'links'
    if session.authenticated?
      @transitionTo(nextPath)

  render: ->
    <div header = "Login..." className="text-center">
      <button className="btn btn-primary" onClick={@onLoginClick}>login with google</button>
    </div>

module.exports = Login
