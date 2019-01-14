var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {

  $http.get("http://localhost:3000/collections")
  .then(function(response) {
      $scope.myWelcome = response.data;
  });
  
});