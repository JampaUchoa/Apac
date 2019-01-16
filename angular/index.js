var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {

  $scope.macroregions = [];
  $scope.microregions = [];
  $scope.stations = [];
  $scope.equipments = [];

  $http.get("http://localhost:3000/states")
  .then(function(response) {
      $scope.states = response.data;
  });

  $http.get("http://localhost:3000/states/0")
  .then(function(response) {
      $scope.macroregions = response.data;
  });

  $http.get("http://localhost:3000/macroregion/0")
  .then(function(response) {
      $scope.microregions = response.data;
  });

  $http.get("http://localhost:3000/microregion/0")
  .then(function(response) {
      $scope.stations = response.data;
  });
  
  $http.get("http://localhost:3000/equipments")
  .then(function(response) {
      $scope.equipments = response.data;
  });

  $scope.form = {
    stations: [],
    stationsIds: [],
    equipment: 0,
    day: 0,
    value: 0,
  }

  $scope.sendData = function(){
    $http.post('http://localhost:3000/collection', $scope.form)
    .then(function(response) {
        console.log(response);
    });
  }

  $scope.addStation = function(st){
    $scope.form.stations.push(st);
    $scope.form.stationsIds.push(st.id);
    st.hide = true;
  }

});