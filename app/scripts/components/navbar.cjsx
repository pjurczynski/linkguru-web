React = require 'react'
Link = require('react-router').Link
Reflux = require 'reflux'
sessionStore = window.Stores.session

links = window.Actions.links
session = window.Actions.session
Navigation = require("react-router").Navigation



Navbar = React.createClass
  mixins: [Reflux.listenTo(sessionStore, "onSessionStateChange"), Navigation]

  getInitialState: ->
    session: {}

  onQueryChange: (e) ->
    links.search(e.target.value)

  onSessionStateChange: (session) ->
    @setState(session: session)

  onLogoutClick: ->
    session.logout()
    @transitionTo('login')

  render: ->
    <nav className='navbar navbar-default navbar-fixed-top'>
      <div className='container'>
        <div className='navbar-header'>
          <a className='navbar-brand' href='#'>LinkGuru</a>
        </div>
        <div className='collapse navbar-collapse'>
          <ul className='nav navbar-nav'>
            <li><Link to="links">links</Link></li>
            <li><Link to="newLink">+</Link></li>
          </ul>
          <form className="navbar-form navbar-left" role="search">
            <div className="form-group">
              <input type='text' className='form-control' placeholder='Search' onChange={@onQueryChange} required/>
            </div>
          </form>
          <ul className='nav navbar-nav navbar-right'>
            <li>
              {
                if @state.session.authenticated
                  <a onClick={@onLogoutClick}>logout</a>
                else
                  <Link to="login">login</Link>
              }
            </li>
          </ul>
        </div>
      </div>
    </nav>

module.exports = Navbar
