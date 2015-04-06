sessions = (api) ->
  create: (data) ->
    api.post('sessions', data)

  destroy: ->
    api.del('sessions')

  setToken: (token) ->
    api.client.headers['token'] = token

exports.initialize = (api) -> sessions(api)
