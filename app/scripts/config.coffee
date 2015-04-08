config =
  development:
    apiHost: 'http://localhost:8000/api/'
  staging:
    apiHost: 'http://staging.linkguru.divshot.io/__/proxy/api/'
  production: {}

module.exports = config[window.__env?.name || 'development']
