'use strict'

angular.module('draftstoneApp')
  .controller 'MainCtrl', ($scope, Classes, Cards) ->
    Classes.then (res) ->
      $scope.classes = res.data

    Cards.then (res) ->
      $scope.cards = res.data

    $scope.getCommons = (c) ->
      a = _.filter $scope.cards[c.name], (card) -> card.quality is "common" or card.quality is "free"
      b = _.filter $scope.cards["neutral"], (card) -> card.quality is "common" or card.quality is "free"
      a.concat b

    $scope.getRares = (c) ->
      a = _.filter $scope.cards[c.name], (card) -> card.quality is "rare"
      b = _.filter $scope.cards["neutral"], (card) -> card.quality is "rare"
      a.concat b

    $scope.getEpics = (c) ->
      a = _.filter $scope.cards[c.name], (card) -> card.quality is "epic"
      b = _.filter $scope.cards["neutral"], (card) -> card.quality is "epic"
      a.concat b

    $scope.getLegendaries = (c) ->
      a = _.filter $scope.cards[c.name], (card) -> card.quality is "legendary"
      b = _.filter $scope.cards["neutral"], (card) -> card.quality is "legendary"
      a.concat b

    $scope.getRareSelections = ->
      r = Math.random()
      if r < 0.05
        cards = $scope.legendaries
      else if r < 0.2
        cards = $scope.epics
      else
        cards = $scope.rares
      _.sample(cards, 3)

    $scope.getCommonSelections = ->
      _.sample($scope.commons, 3)

    $scope.selectClass = (c) ->
      $scope.selectedClass = c
      $scope.commons = $scope.getCommons(c)
      $scope.rares = $scope.getRares(c)
      $scope.epics = $scope.getEpics(c)
      $scope.legendaries = $scope.getLegendaries(c)
      $scope.setNewCardSelections 1

    $scope.selections = {}

    $scope.numSelectedCards = ->
      Object.keys($scope.selections).length

    $scope.selectCard = (c) ->
      if $scope.numSelectedCards() == 30
        return
      if $scope.selections[c.id]
        $scope.selections[c.id].count = $scope.selections[c.id].count + 1
      else
        $scope.selections[c.id] =
          card: c
          count: 1
      $scope.setNewCardSelections($scope.numSelectedCards() + 1)

    $scope.newCardSelections = []

    $scope.setNewCardSelections = (n) ->
      if n is 1 or n is 10 or n is 20 or n is 30 or Math.random() < 0.08
          $scope.newCardSelections = $scope.getRareSelections()
      else
          $scope.newCardSelections = $scope.getCommonSelections()

    $scope.showMain = ->
      $scope.numSelectedCards() < 30

    $scope.reset = ->
      $scope.selectedClass = null
      $scope.selections = {}

    $scope.getSelectionMana = (selection) ->
      console.log "LSJDFKLJSDF"
      selection.card.mana
