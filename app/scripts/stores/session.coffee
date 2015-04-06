Reflux = require 'reflux'
sessionsApi = Window.Api.sessions

sessionStore = Reflux.createStore
  init: ->
    @listenToMany Window.Actions.session
    @data =
      user: {}
      authenticated: false
      state: 'initialized'

  onGoogleResposne: (authData) ->
    sessionsApi.create(code: authData.code).done (response) =>
      @data.state = 'ok'
      @data.authenticated = true
      sessionsApi.setToken(response.body.token)
      @trigger(@data)
    ,(error) ->
      debugger

  onLogin: ->
    @data.state = 'authenticating'
    authOptions =
      scope: "email"
      client_id: "350736527263-cbf12n3m28b9a158hsc495rpvpd759bd.apps.googleusercontent.com"
      accesstype: "offline"
      cookiepolicy: "single_host_origin"
      response_type: "code"

    gapi.auth.authorize authOptions, @onGoogleResposne

  onLogout: ->
    gapi.auth.signOut()
    sessionsApi.destroy()
    @data.authenticated = false
    @trigger(@data)

  isAuthenticated: ->
    false

module.exports = sessionStore
