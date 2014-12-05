React = require 'react'


MissingRoute = React.createClass
  render: ->
    <div className='alert alert-warning'>uh oh you must be drunk... there is no page like that!</div>

module.exports = MissingRoute

