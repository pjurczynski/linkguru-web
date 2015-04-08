React = require 'react'
Router = require 'react-router'
Route = Router.Route
Routes = Router.Routes
DefaultRoute = Router.DefaultRoute
NotFoundRoute = Router.NotFoundRoute

Layout = require './components/layout'
Home = require './components/home'
MissingRouteComponent = require './components/missing_route'
TagsComponent =  require './components/tags'
Tag =  require './components/tag'
LinksComponent = require './components/links'
LoginComopnent = require './components/login'
NewLinkComponent = require './components/new_link'



routes = (
  <Route name="layout" path="/" handler={Layout}>
    <DefaultRoute handler={Home}/>
    <Route name='links' path='/links' handler={LinksComponent}/>
    <Route name='newLink' path='/links/new' handler={NewLinkComponent}/>
    <Route name='login' handler={LoginComopnent}/>
    <NotFoundRoute handler={MissingRouteComponent}/>
  </Route>
)

exports.start = ->
  Router.run routes, (Handler) ->
    React.render(<Handler/>, document.getElementById('content'))
