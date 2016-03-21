angular.module('invocadores').directive 'navigationBar', ->
  restrict: 'E'
  replace: true
  transclude: true
  templateUrl: 'assets/navigation-bar.html'
  controller: ($scope) ->

    $scope.links = [
      { path: 'invocador',   name: 'Invocador' }
    ]
