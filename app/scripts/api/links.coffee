Links = (api) ->
  all: ->
    api.get('links')

  add: (payload) ->
    api.post('links', link: payload)

  update: (id, payload) ->
    api.put("links/#{id}", link: payload)

  upVote: (link) ->
    api.post("links/#{link.id}/upvote")

  downVote: (link) ->
    api.post("links/#{link.id}/downvote")

exports.initialize = (api) -> Links(api)
