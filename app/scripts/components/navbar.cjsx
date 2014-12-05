React = require 'react'
Link = require('react-router').Link

actions = Window.Actions.links


Navbar = React.createClass
  onQueryChange: (e) ->
    actions.search(e.target.value)

  render: ->
    <nav className='navbar navbar-default navbar-fixed-top'>
      <div className='container'>
        <div className='navbar-header'>
          <a className='navbar-brand' href='#'>LinkGuru</a>
        </div>
        <div className='collapse navbar-collapse'>
          <ul className='nav navbar-nav'>
            <li><Link to="links">links</Link></li>
            <li><Link to="tags">tags</Link></li>
          </ul>
          <form className="navbar-form navbar-left" role="search">
            <div className="form-group">
              <input type='text' className='form-control' placeholder='Search' onChange={@onQueryChange} required/>
            </div>
          </form>
          <ul className='nav navbar-nav navbar-right'>
            <li><a href='#'>TODO: User data</a></li>
          </ul>
        </div>
      </div>
    </nav>

module.exports = Navbar
