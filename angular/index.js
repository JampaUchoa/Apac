"use strict";

var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {

  $scope.macroregions = [];
  $scope.microregions = [];
  $scope.stations = [];
  $scope.equipments = [];
  $scope.stationsSelected = [];

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

  $http.get("http://localhost:3000/collections")
  .then(function(response) {
      $scope.collections = response.data;
  });

  $scope.form = {
    stationsIds: [],
    equipment: 0,
    day: 0,
    value: 0,
  }

  $scope.sendData = function() {
    $scope.form.stationsIds = ($scope.stations.filter(st => st.selected)).map(st => st.id);

    $http.post('http://localhost:3000/collection', $scope.form)
    .then(function() {
        $http.get("http://localhost:3000/collections")
        .then(function(response) {
            $scope.collections = response.data;
        });
    });
  }

  $scope.toggleSelection = function(st) {
     console.log(1)
    st.selected = !st.selected;
  }

  $scope.getStation = function(id) {
    if ($scope.stations) return $scope.stations.filter(st => st.id == id)[0].name;
  }

  $scope.getEquipment = function(id) {
    if ($scope.equipments) return $scope.equipments.filter(eq => eq.id == id)[0].name;
  }
  
});