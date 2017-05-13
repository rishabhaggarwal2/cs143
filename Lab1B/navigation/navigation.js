function NavigationController($scope) {
	$scope.name = "lol";
	console.log("lol");
}

angular.module('myApp').component('navigation', {
	templateUrl: 'navigation/navigation.html',
	controller: NavigationController,
	bindings: {
		hero: '='
	}
});