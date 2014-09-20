(function() {
  'use strict';
  angular.module('ngCountup', []).directive('countUp', function() {
    return {
      restrict: "A",
      require: "ngModel",
      scope: {
        ngModel: '='
      },
      link: function(scope, element, attrs) {
        var animationLength, numDecimals;
        console.log("scope is ", scope);
        console.log("ngModel is ", scope.ngModel);
        numDecimals = 0;
        animationLength = 4;
        if ((attrs.numDecimals != null) && attrs.numDecimals >= 0) {
          numDecimals = attrs.numDecimals;
        }
        if ((attrs.animationLength != null) && attrs.animationLength > 0) {
          animationLength = attrs.animationLength;
        }
        return scope.$parent.$watch(attrs.ngModel, function(newVal, oldVal) {
          console.log("ngModel has changed! " + newVal + " " + oldVal);
          if (oldVal == null) {
            oldVal = 0;
          }
          if (newVal == null) {
            newVal = 0;
          }
          if (newVal != null) {
            console.log("running countup now! " + newVal + " " + oldVal);
            return new countUp(attrs.id, oldVal, newVal, numDecimals, animationLength).start();
          }
        });
      }
    };
  });

}).call(this);
