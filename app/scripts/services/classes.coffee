'use strict'

angular.module('draftstoneApp')
  .service 'Classes', ($http) ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    $http({method: 'GET', url: 'data/classes.json'}).
      success (res) ->
        res.body