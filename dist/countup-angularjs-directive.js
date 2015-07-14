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
        var numDecimals, opts;
        opts = {};
        if (attrs.prefix != null) {
          opts.prefix = attrs.prefix;
        }
        if (attrs.suffix != null) {
          opts.suffix = attrs.suffix;
        }
        numDecimals = 0;
        if ((attrs.numDecimals != null) && attrs.numDecimals >= 0) {
          numDecimals = attrs.numDecimals;
        }
        return scope.$parent.$watch(attrs.ngModel, function(newVal, oldVal) {
          if (newVal == null) {
            newVal = 0;
          }
          if (oldVal == null) {
            oldVal = 0;
          }
          if (newVal != null) {
            return new CountUp(attrs.id, oldVal, newVal, numDecimals, 4, opts).start();
          }
        });
      }
    };
  });

}).call(this);
