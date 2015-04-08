sessionStore = window.Stores.session

Authentication =
  statics:
    willTransitionTo: (transition) ->
      nextPath = transition.path
      if !sessionStore.data.authenticated
        transition.redirect('/login', {}, { 'nextPath' : nextPath })

module.exports = Authentication
