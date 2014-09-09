'use strict'
angular.module('ngCountup', [])
.directive 'countUp', ->
  restrict: "A" # For use on attributes only
  require: "ngModel" # Must have an ngModel to get the countUp value from
  scope: true # Will not create an isolate, child scope. If we put an object here, it will
  link: (scope, element, attrs) ->
    numDecimals = 0 # Default to show 0 decimals
    animationLength = 4 # Default to animate for 4 secs

    if attrs.numDecimals? and attrs.numDecimals >= 0
      numDecimals = attrs.numDecimals
    if attrs.animationLength? and attrs.animationLength > 0
      animationLength = attrs.animationLength

    scope.$watch attrs.ngModel, (newVal, oldVal) ->
      if !oldVal? then oldVal = 0
      if newVal? and newVal isnt oldVal
        new countUp(attrs.id, oldVal, newVal, numDecimals, animationLength).start()

