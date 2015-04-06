Request = require('request-json')
Promise = require('promise')

_ = require 'underscore'
sessions = require('./api/sessions')
links = require('./api/links')
client = Request.createClient('http://localhost:8000/api/')

successStatus = (status) ->
  status >= 200 && status < 300

handleResponse = (resolve, reject, err, res, body) ->
  if (err || !successStatus(res.statusCode))
    error = { body: body, status: res.statusCode, error: err }
    reject(error)
  else
    res.data = body
    resolve(res)

baseApi =
  client: client
  post: (url, options) ->
    new Promise (resolve, reject) ->
      client.post url, options, (err, res, body) ->
        handleResponse(resolve, reject, err, res, body)

  get: (url) ->
    new Promise (resolve, reject) ->
      client.get url, (err, res, body) ->
        handleResponse(resolve, reject, err, res, body)

  put: (url, options) ->
    new Promise (resolve, reject) ->
      client.put url, options, (err, res, body) ->
        handleResponse(resolve, reject, err, res, body)

  del: (url) ->
    new Promise (resolve, reject) ->
      client.del url, (err, res, body) ->
        handleResponse(resolve, reject, err, res, body)

api =
  sessions: sessions.initialize(baseApi)
  links: links.initialize(baseApi)

module.exports = api
