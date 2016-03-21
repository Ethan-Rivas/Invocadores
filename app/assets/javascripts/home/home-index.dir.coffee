angular.module('invocadores').directive 'homeIndex', ->
  restrict: 'E'
  replace: true
  transclude: true
  templateUrl: '/assets/home/home-index.tmpl.html'
