"use strict"

# Declare app level module which depends on views, and components
angular.module("myApp", ["ngCountup"]).controller "AppCtrl", [
  "$scope"
  ($scope) ->
    $scope.specialfruit =
      name: "Special fruit"
      count: 4828

    $scope.fruits = [
      name: "Apples"
      count: 1893
    ,
      name: "Bananas"
      count: 2984
    ]

    $scope.updateCount = ->
      $scope.specialfruit.count += 8429 # Random increments
      $scope.fruits[0].count += 2848
      $scope.fruits[1].count += 3848

]