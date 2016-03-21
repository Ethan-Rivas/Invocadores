angular.module('invocadores').directive 'findSummoners', ->
  restrict: 'A'
  replace: true
  transclude: true
  templateUrl: '/assets/summoners/find-summoners.tmpl.html'
