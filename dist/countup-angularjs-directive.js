(function() {
  'use strict';
  angular.module('ngCountup', []).directive('countUp', function() {
    return {
      restrict: 'A',
      require: 'ngModel',
      scope: {
        ngModel: '=',
        numDecimals: '='
      },
      link: function(scope, element, attrs) {
        return scope.$watch("ngModel", function(newVal, oldVal) {
          if ((newVal != null) && (scope.numDecimals != null)) {
            if (oldVal == null) {
              oldVal = 0;
            }
            console.log("running countUp, " + newVal + " " + scope.numDecimals + " ");
            new countUp(attrs.id, oldVal, newVal, scope.numDecimals, 4).start();
          }
        });
      }
    };
  });

}).call(this);
