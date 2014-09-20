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
        console.log("scope is ", scope);
        console.log("ngModel is ", scope.ngModel);
        return scope.$parent.$watch(attrs.ngModel, function(newVal, oldVal) {
          console.log("ngModel has changed! " + newVal + " " + oldVal);
          if (oldVal == null) {
            oldVal = 10228;
          }
          if (newVal == null) {
            newVal = 98200;
          }
          if (newVal != null) {
            console.log("running countup now! " + newVal + " " + oldVal);
            return new countUp(attrs.id, oldVal, newVal).start();
          }
        });
      }
    };
  });

}).call(this);
