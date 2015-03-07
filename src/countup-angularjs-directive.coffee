# https://gist.github.com/CMCDragonkai/6282750
'use strict'
angular.module('ngCountup', [])
.directive 'countUp', ->
  restrict: 'A' # For use on attributes only
  require: 'ngModel' # Must have an ngModel to get the countUp value from
  # scope: true # Will not create an isolate, child scope. If we put an object here, it will
  scope:
    ngModel: '='
    numDecimals: '='
  link: (scope, element, attrs) ->
    scope.$watch "ngModel", (newVal, oldVal) ->
      if newVal? and scope.numDecimals?
        oldVal ?= 0
        console.log "running countUp, #{newVal} #{scope.numDecimals} #{}"
        new countUp(attrs.id, oldVal, newVal, scope.numDecimals, 4).start()
        return