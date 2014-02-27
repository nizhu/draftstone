'use strict'

angular.module('draftstoneApp')
  .service 'Cards', ($http) ->
    $http({method: 'GET', url: 'data/cards.json'}).
      success (res) ->
        res.body