chemistryApp.directive('periodicchartelement', function (chemistryService) {;
    return {
        restrict: 'E',
        templateUrl: '/2014/05/angularJS-intro-to-directives/template/periodic-template.html',
        scope:{
            element:'=',
            cssType:'=csstypeclass'
        }

    }

});