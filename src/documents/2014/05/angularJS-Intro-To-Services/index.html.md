---
layout: post
title: AngularJS - Introduction to Services
date: 2014-5-19
tags: ["AngularJS","JavaScript","Web"]
---

[AngularJS](http://www.angularjs.org) is a Javascript MVC framework from the fine folks over at
[Google](http://www.google.com). The focus of Angular is building complex
 HTML based client applications. Its design philosophy is data first, where your data will be updating the DOM.
 Contrast this to a framework like JQuery where the DOM will update your data.

![AngularJS Logo](angularLogo.png)

This is the eight in a series of posts on AngularJS where we are using Chemistry data from the periodic table
to help us understand the framework. The others posts are

1. [AngularJS - Introduction](http://www.jptacek.com/2013/10/angularjs-introduction/)
2. [AngularJS - Introducing AngularJS Controllers](http://www.jptacek.com/2013/10/introducing-angularjs-controllers/)
3. [AngularJS - Introducing NG-Repeat](http://www.jptacek.com/2013/10/angularjs-introducing-ng-repeat/)
4. [AngularJS - More with NG-Repeat](http://www.jptacek.com/2014/01/angularjs-further-with-ng-repeat/)
5. [AngularJS - Image Binding](http://www.jptacek.com/2014/01/angularjs-lou-reed/)
6. [AngularJS - Introducing Templates](http://www.jptacek.com/2014/02/angularJS-templates/)
7. [AngularJS - Introducing Routing](http://www.jptacek.com/2014/02/angularJS-IntroToRouting/)
8. AngularJS - Introduction to Services
9. [AngularJS - Introduction to Directives](http://www.jptacek.com/2014/06/angularJS-intro-to-directives/)
10. [AngularJS - Further with Directives](http://www.jptacek.com/2014/12/angularJS-further-with-directives/)

>Note: AngularJS does not allow for more than one ng-app directive. When I have multiple angular posts on
the home page of my blog, only one application will work. I need to refactor the entire site to account for
this. All of that to say this, you are best clicking on a single article so you can see the pages in action.

In AngularJS, when we want to create common code to be shared across our application, we create services. In the Angular world,
the controller is the traffic cop, which directs data to your view for binding. Logic for retrieving that data falls to a
service.

Services are stateless object that have shared functions that can be used in multiple controllers or views. The functions on
services are also available throughout; they can be accessed in directives, controllers, filters, etc.

For an example of a real world service that I have used in the past…. When creating a select list in HTML for an AngularJS
application, you usually have an ID associated with a selected element from the list. Often you will
display all the properties of the JSON object. In JavaScript, to find this element, you need to loop through all
the elements in an array until you get a match on the key.  Depending on the size of your application, you end up writing this
logic many, many times. To minimize this, I have written a helper application that creates an array that allows for
 an element to be accessed by a key value, thus reducing the need for repetitive array looping.

Generally, there are two ways to create services within your application. The most common is to use ``module.service`` within
 your application. The second is ``module.factory``. There are a couple of other ways, but we will skip those. AngularJS
 services are really singleton objects. The object from services are then available across your application via dependency
 injection, which we will look at soon.

 The main difference between the two service creation methods is how they are used. The ``module.service`` approach creates an
 instance of a function. A good use case for this approach is the generic array lookup function mentioned above. The
 ``module.factory`` approach is that the returned value is returned by invoking a function reference. This essentially allows you
 to treat the service like a class that you can new to make new instances.


The syntax for ``module.service`` is

```javascript
var chemistryApp = angular.module('chemistryApp', []);

//
chemistryApp.service('chemistryService', function(){
    this.elementName= function(element){
        return element.name;
    };
});

//
function ChemCtrl($scope, chemistryService)
{
    ...
    $scope.nameFromService = chemistryService.elementName(elements[0]);
}
```

The syntax for ``module.factory`` is

```javascript
var chemistryApp = angular.module('chemistryApp', []);

//
chemistryApp.factory('chemistryService', function(){
      return {
            nameFromService: function(element){
               return element.name;
            }
        }
    });

//
function ChemCtrl($scope, chemistryService)
{
    ...
    $scope.nameFromFactory = chemistryService.elementName(elements[0]);
}
```

Once we create our service, we want to be able to use this within our application. This is done via the magical gremlins
that drive the Dependency Injection model in AngularJS. We just pass the service name to our controller when we instantiate
it. We showed this above, but just to be sure, by passing ``chemistryService`` to the controller, it is service is
available within the
controller scope

```javascript
function ChemCtrl($scope, chemistryService)
{
    ...
    $scope.nameFromFactory = chemistryService.elementName(elements[0]);
}
```
Let's look at a more advanced scenario. I am pretty much stealing this demo from my
[Skyline Technologies](http://www.SkylineTechnologies.com)
colleague [Brian Mahloch](https://twitter.com/bmahloch). Brian came up with a great demo for demonstrating services
using the Periodic Data, which he kindly let me steal.

What we are going to do is determine the type of bonds two elements would make, based on the differences in their
electronegativity. We will create a service that does two things, calculate the differences in electronegativty and then
based on the difference determine the type of bond.

Our service then looks like
```javascript
chemistryApp.service('chemistryService', function () {

    this.calculateElectronegativityDifference = function (element1, element2) {

        return Math.abs(element1.electronegativity - element2.electronegativity);

    };

    this.convertElectronegativityDifferenceToName = function (difference) {

        if (difference > 2.0) {
            return 'Ionic Bond';
        } else if (difference >= 0.5 < 1.6) {
            return 'Polar Covalent Bond';
        } else {
            return 'NonPolar Covalent Bond';
        }

    };
});

```

Our controller creation then gets updated so that we are injecting the service into the parameter list. Next,
since $scope is our conduit for the view to talk to the service, we create a function on the controller that will
consume the service when we have two elements selected.

```javascript
chemistryApp.controller('chemServiceCtrl', ['$scope', 'chemistryService',
    function chemServiceCtrl($scope, $log, chemistryService) {

        $scope.elements = periodicData.elements;

        $scope.calculateBondPolarity = function () {

            if ($scope.selectedElement1 && $scope.selectedElement2) {

                $scope.currentBondDifference = chemistryService.calculateElectronegativityDifference($scope.selectedElement1, $scope.selectedElement2);
                $scope.currentBondType = chemistryService.convertElectronegativityDifferenceToName($scope.currentBondDifference);

            }

        };

        /* private methods */

    }]
);
```

Tying it all together, we have something like this.

<div id="app" ng-app="chemistryApp">
<form name="submitForm" class="form-horizontal" ng-controller="chemServiceCtrl">
                <div class="form-group" style="margin-top:14px;">
                    <div class="control-label col-md-2">
                        Element 1:
                    </div>
                    <div class="col-md-4">
                        <select class="form-control" ng-model="selectedElement1" ng-options="e.name for e in elements | orderBy:['name']" ng-change="calculateBondPolarity()"></select>
                    </div>
                    <div class="control-label col-md-2">
                        Element 2:
                    </div>
                    <div class="col-md-4">
                        <select class="form-control" ng-model="selectedElement2" ng-options="e.name for e in elements  | orderBy:['name']" ng-change="calculateBondPolarity()"></select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6" style="text-align:center;" ng-show="selectedElement1">
                        You have selected:<br />
                        <strong>{{selectedElement1.name}}</strong><br />
                        Electronegativity:<br />
                        <strong>{{selectedElement1.electronegativity}}</strong>
                    </div>
                    <div class="col-md-6" style="text-align:center;" ng-show="selectedElement2">
                        You have selected:<br />
                        <strong>{{selectedElement2.name}}</strong><br />
                        Electronegativity:<br />
                        <strong>{{selectedElement2.electronegativity}}</strong>
                    </div>
                </div>
                        <div class="row rounded-group-box" ng-show="selectedElement1 && selectedElement2">
                            <div class="col-md-12" style="text-align:center;">
                                <strong>{{selectedElement1.name}}</strong> + <strong>{{selectedElement2.name}}</strong> = <strong>{{currentBondType}}</strong><br /><br />
                                <small>With a electronegativity difference of {{currentBondDifference | number:2}} {{selectedElement1.name}} and {{selectedElement2.name}} would form a {{currentBondType}}</small>
                            </div>
                        </div>

</form>
</div>

We can now start to see how AngularJS provides a platform for creating web applications. With services, we are able to
encapsulate logic and use it within multiple controllers in our application.

You can either visit [http://angularperiodic.azurewebsites.net/](http://angularperiodic.azurewebsites.net/) to see the code in action and
as always find the code out on [GitHub](https://github.com/jptacek/AngularPeriodic).


<script type="text/javascript" src="/2014/05/angularJS-Intro-To-Services/js/chemistryApp.js"></script>
<script type="text/javascript" src="/2014/05/angularJS-Intro-To-Services/js/chemistryController.js"></script>
<script type="text/javascript" src="/2014/05/angularJS-Intro-To-Services/js/chemistryService.js"></script>
<script type="text/javascript" src="/2014/05/angularJS-Intro-To-Services/js/chemistry.js"></script>


