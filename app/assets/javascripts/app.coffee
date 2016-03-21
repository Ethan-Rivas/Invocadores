angular
  .module('invocadores', [
    'ngResource', 'ngRoute',
    'route-segment', 'view-segment',
    'ui.bootstrap'
  ])
  .config ['$httpProvider', '$routeSegmentProvider', ($httpProvider, $routeSegmentProvider) ->

    $httpProvider.defaults.headers.common['X-CSRF-Token'] =
      document.querySelector('meta[name=csrf-token]').content

    $routeSegmentProvider.
      when('/home',                          'home').
      when('/home/welcome',                  'home.welcome').
      when('/home/welcome/index',            'home.welcome.index').

      when('/invocador',                     'invocador').
      when('/invocador/pefil',               'invocador.perfil').
      when('/invocador/perfil/index',        'invocador.perfil.index').
      when('/invocador/perfil/editar',       'invocador.perfil.editar').

      segment('invocador',
        templateUrl: 'assets/summoners/invocador/invocador.html'
      ).

      within().
        segment('perfil',
          templateUrl: 'assets/summoners/invocador/perfil.html'
          default: true
        ).

        within().
          segment('index',
            templateUrl: 'assets/summoners/invocador/perfil/index.html'
            default: true
          ).

          segment('editar',
            templateUrl: 'assets/summoners/invocador/perfil/editar.html'
          ).

        up().
      up().

      segment('home',
          templateUrl: 'assets/home/home.html'
          default: true
        ).

        within().
          segment('welcome',
            templateUrl: 'assets/home/welcome.html'
            default: true
          ).

          within().
            segment('index',
              templateUrl: 'assets/home/welcome/index.html'
              default: true
            ).

          up().
        up()

  ]
