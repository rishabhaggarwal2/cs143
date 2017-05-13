'use strict';

angular.module('myApp.movie', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
	$routeProvider.when('/movie/:id', {
		templateUrl: 'movie/movie.html',
		controller: 'MovieCtrl'
	});
}])

.controller('MovieCtrl', ['$scope', '$http', '$routeParams', function($scope, $http, $routeParams) {
	function getImage(i) {
		$http.get("https://api.themoviedb.org/3/search/movie?api_key=879b8cb4b0ea74e6d0cba984687aff7d&language=en-US&query="+$scope.actor.first+"&page=1&year="+$scope.actor.last)
			.then(function(response) {
				$scope.actor.url = "https://image.tmdb.org/t/p/w1000" + response.data.results[0].backdrop_path;
				console.log(response);
				console.log(response.data.results[0].poster_path);
				$(".movie__container").css("background","url(" + $scope.actor.url + ")");
				$scope.$digest;
			});
	}

	$http.get("api/show_movie.php?id=" + $routeParams.id)
		.then(function (response) {
			// $scope.names = response.data.records;
			console.log(response.data.records);
			$scope.actor = response.data.records[0];
			$scope.$digest;
			if($scope.actor) {
				getImage(0);
			}
		});
}]);