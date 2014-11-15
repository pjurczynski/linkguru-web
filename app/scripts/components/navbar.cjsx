React = require 'react'
Link = require('react-router').Link

Navbar = React.createClass
  render: ->
    <nav className='navbar navbar-default navbar-fixed-top'>
      <div className='container'>
        <div className='navbar-header'>
          <a className='navbar-brand' href='#'>LinkGuru</a>
        </div>
        <div className='collapse navbar-collapse'>
          <ul className='nav navbar-nav'>
            <li>
              <Link to="tags">tags</Link>
            </li>
          </ul>
          <ul className='nav navbar-nav navbar-right'>
            <li><a href='#'>TODO: User data</a></li>
          </ul>
        </div>
      </div>
    </nav>

module.exports = Navbar

# --- react-bootstrap ---
## this need to wait, till they will fix react 0.12.0 compatibility
    # BS = require 'react-bootstrap'
    # Navbar = BS.Navbar
    # Nav = BS.Nav
    # NavItem = BS.NavItem
    # [..]
    # <Navbar brand="LinkGuru" fixedTop=true>
    #   <Nav pullRight=true>
    #     <NavItem key={1} href="#">Login</NavItem>
    #   </Nav>
    # </Navbar>
