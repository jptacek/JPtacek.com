chemistryApp.controller('chemistryController', ['$scope', 'chemistryService','$log',
        function chemistryController($scope,  chemistryService,$log) {

            $scope.elements = chemistryService.getElements();

            $scope.periodicElement = $scope.elements[0];

            $scope.getCssClassElement = chemistryService.getCssClassElement($scope.periodicElement.type);

            $scope.updateController = function(selectedElement) {
                $scope.periodicElement = selectedElement;
                $scope.getCssClassElement = chemistryService.getCssClassElement($scope.periodicElement.type);
            };

        }]
);
