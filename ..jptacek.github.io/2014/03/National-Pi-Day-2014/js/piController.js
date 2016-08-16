piApp.controller('piAppController',
    function piAppController($scope) {
        $scope.iterations = 10;
        determinePi($scope.iterations);
        $scope.isCalculating = false;


        $scope.calculatePi = function() {
            $scope.isCalculating = true;
            determinePi($scope.iterations);
        }

        function determinePi(iterations) {
            var hitsInCircle;
            hitsInCircle = 0;
            var xPos,yPos;

            for (var i=0;i<iterations;i++) {
                xPos = Math.random();
                yPos = Math.random();

                if (xPos*xPos + yPos*yPos <= 1.0) {
                    hitsInCircle = hitsInCircle+1;
                }
            }

            $scope.pi = 4.0 * hitsInCircle/iterations;
            $scope.delta = Math.abs(3.1415927 - $scope.pi);
            $scope.isCalculating = false;
        }



    }
);