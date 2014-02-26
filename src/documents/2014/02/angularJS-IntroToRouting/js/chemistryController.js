chemistryApp.controller('chemListCtrl',
    function chemListCtrl($scope,$log) {
        $log.info('in list');
        $scope.periodic = periodicData;
    }
).controller('chemItemCtrl',
    function chemItemCtrl($scope, $log,$routeParams) {
        $log.info('hello world');
        var itemId = $routeParams.atomicNumber;
        $log.info(itemId);
        $scope.element = periodicData.elements[itemId];
    }
);
