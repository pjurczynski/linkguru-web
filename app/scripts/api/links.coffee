Links = (api) ->
  all: ->
    api.get('links')

  add: (payload) ->
    api.post('links', link: payload)

  update: (id, payload) ->
    api.put("links/#{id}", link: payload)

  remove: (id) ->
    api.del("links/#{id}")

  upVote: (link) ->
    api.post("links/#{link.id}/upvote")

  downVote: (link) ->
    api.post("links/#{link.id}/downvote")

exports.initialize = (api) -> Links(api)
