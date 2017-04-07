# https://gist.github.com/CMCDragonkai/6282750
'use strict'
angular.module('ngCountup', [])
.directive 'countUp', ->
  restrict: 'A' # For use on attributes only
  require: 'ngModel' # Must have an ngModel to get the countUp value from
  scope:
    ngModel: '='
  link: (scope, element, attrs) ->
    scope.$parent.$watch attrs.ngModel, (newVal, oldVal) ->
      if newVal? and newVal isnt oldVal
        opts = {}
        if attrs.prefix?
          opts.prefix = attrs.prefix
        if attrs.suffix?
          opts.suffix = attrs.suffix  
        numDecimals = 0
        animationLength = 4
        if attrs.numDecimals? and attrs.numDecimals >= 0
          numDecimals = attrs.numDecimals
        if attrs.animationLength? and isFinite attrs.animationLength
          animationLength = attrs.animationLength
        newVal ?= 0
        oldVal ?= 0
        new CountUp(attrs.id, oldVal, newVal, numDecimals, animationLength, opts).start()