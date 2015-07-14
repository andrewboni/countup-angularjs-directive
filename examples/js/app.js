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
          count: 159
        }, {
          name: "Bananas",
          count: 1824
        }, {
          name: "Oranges",
          count: 28947
        }
      ];
      return $scope.updateCount = function() {
        $scope.specialfruit.count += Math.random() * 9999;
        $scope.fruits[0].count += Math.random() * 9999;
        $scope.fruits[1].count += Math.random() * 9999;
        $scope.fruits[2].count += Math.random() * 9999;
        return
      };
    }
  ]);

}).call(this);
