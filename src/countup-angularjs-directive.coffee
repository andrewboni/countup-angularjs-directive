'use strict'
angular.module('ngCountup', [])
.directive 'countUp', ->
  restrict: "A" # For use on attributes only
  require: "ngModel" # Must have an ngModel to get the countUp value from
#  scope: true # Will not create an isolate, child scope. If we put an object here, it will
  scope:
    ngModel: '='
#    id: '@'
  link: (scope, element, attrs) ->
    console.log "scope is ", scope
    console.log "ngModel is ", scope.ngModel
    numDecimals = 0 # Default to show 0 decimals
    animationLength = 4 # Default to animate for 4 secs

    if attrs.numDecimals? and attrs.numDecimals >= 0
      numDecimals = attrs.numDecimals
    if attrs.animationLength? and attrs.animationLength > 0
      animationLength = attrs.animationLength
#    attrs.$observe 'id', (id) ->
#      scope.id = id
    scope.$parent.$watch attrs.ngModel, (newVal, oldVal) ->
      console.log "ngModel has changed! #{newVal} #{oldVal}"
      oldVal ?= 0
      newVal ?= 0
      if newVal?
        console.log "running countup now! #{newVal} #{oldVal}"
        new countUp(attrs.id, oldVal, newVal, numDecimals, animationLength).start()

