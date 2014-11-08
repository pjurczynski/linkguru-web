React = require 'react'

Home = React.createClass

  render: ->

    return (
      <div className="hero-unit">
        <h1>'Allo, 'Allo!</h1>
        <p>You now have</p>
        <ul>
            <li>ReactJS Reflux Boilerplate</li>
            <li>Modernizr</li>
            <li>CoffeeScript</li>
            <li>Sass with Compass</li>
        </ul>
      </div>
    )

module.exports = Home
