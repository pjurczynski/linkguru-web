config =
  development:
    apiHost: 'http://localhost:8000/api/'
  production: {}

module.exports = config[window.__env?.name || 'development']
