(function() {
  'use strict';
  angular.module('ngCountup', []).directive('countUp', function() {
    return {
      restrict: 'A',
      require: 'ngModel',
      scope: {
        ngModel: '='
      },
      link: function(scope, element, attrs) {
        return scope.$parent.$watch(attrs.ngModel, function(newVal, oldVal) {
          var animationLength, numDecimals, opts;
          if ((newVal != null) && newVal !== oldVal) {
            opts = {};
            if (attrs.prefix != null) {
              opts.prefix = attrs.prefix;
            }
            if (attrs.suffix != null) {
              opts.suffix = attrs.suffix;
            }
            numDecimals = 0;
            animationLength = 4;
            if ((attrs.numDecimals != null) && attrs.numDecimals >= 0) {
              numDecimals = attrs.numDecimals;
            }
            if ((attrs.animationLength != null) && isFinite(attrs.animationLength)) {
              animationLength = attrs.animationLength;
            }
            if (newVal == null) {
              newVal = 0;
            }
            if (oldVal == null) {
              oldVal = 0;
            }
            return new CountUp(attrs.id, oldVal, newVal, numDecimals, animationLength, opts).start();
          }
        });
      }
    };
  });

}).call(this);
