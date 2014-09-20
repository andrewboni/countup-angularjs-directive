(function() {
  "use strict";
  angular.module("myApp", ["ngCountup"]).controller("AppCtrl", [
    "$scope", function($scope) {
      $scope.specialfruit = {
        name: "Special fruit",
        count: 4828
      };
      $scope.fruits = [
        {
          name: "Apples",
          count: 1893
        }, {
          name: "Bananas",
          count: 2984
        }
      ];
      return $scope.updateCount = function() {
        $scope.specialfruit.count += 8429;
        $scope.fruits[0].count += 2848;
        return $scope.fruits[1].count += 3848;
      };
    }
  ]);

}).call(this);
