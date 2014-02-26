'use strict';

var chemistryApp = angular.module('chemistryApp', ['ngRoute']).
    config(function($routeProvider) {
        $routeProvider
            .when('/', {
                templateUrl:'/2014/02/angularJS-IntroToRouting/templates/chemList.html',
                controller: 'chemListCtrl'
            }).when('/chemList/:atomicNumber', {
                templateUrl:'/2014/02/angularJS-IntroToRouting/templates/chemItem.html',
                controller: 'chemItemCtrl'
            })
            .otherwise({redirectTo: '/'});
    });
