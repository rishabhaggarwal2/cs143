'use strict';

angular.module('myApp.home', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
	$routeProvider.when('/home', {
		templateUrl: 'home/home.html',
		controller: 'HomeCtrl'
	});
}])

.controller('HomeCtrl', ['$scope', '$http', function($scope, $http) {
	function getImage(i) {
		$http.get("https://api.themoviedb.org/3/search/movie?api_key=879b8cb4b0ea74e6d0cba984687aff7d&language=en-US&query="+$scope.actors[i].first+"&page=1&year="+$scope.actors[i].last)
			.then(function(response) {
				$scope.actors[i].url = "https://image.tmdb.org/t/p/w500" + response.data.results[0].poster_path;
				console.log(response);
				console.log(response.data.results[0].poster_path);
				if (i >9) {
					$scope.$digest;
					console.log($scope.actors[0]);
				}
			});
	}
	
	$http.get("api/show_all.php")
		.then(function (response) {
			// $scope.names = response.data.records;
			console.log(response.data.records);
			$scope.actors = response.data.records;
			$scope.$digest;
			for(var i = 0; i < 10 ; i++) {
				getImage(i);
			}
		});
}]);