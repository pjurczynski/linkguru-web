React = require 'react'
Router = require 'react-router'
Route = Router.Route
Routes = Router.Routes
DefaultRoute = Router.DefaultRoute

Layout = require './components/layout'
Home = require './components/home'
TagsComponent =  require './components/tags'
Tag =  require './components/tag'

routes = (
  <Routes>
    <Route name="layout" path="/" handler={Layout}>
      <DefaultRoute handler={Home}/>
      <Route name='tags' handler={TagsComponent}>
        <Route name='tag' path=":name" handler={Tag}/>
      </Route>
    </Route>
  </Routes>
)

exports.start = ->
  React.renderComponent routes, document.getElementById('content')
