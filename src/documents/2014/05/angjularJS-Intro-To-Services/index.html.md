---
layout: post
title: AngularJS - Introduction to Services
date: 2014-5-18
ignored: true
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

In AngularJS, when we want to create common code to be shared across our application, we create services. In the Angular world,
the controller is the traffic cop, which directs data to your view for binding. Logic for retrieving that data falls to a
service.

Services are stateless object that have shared functions that can be used in multiple controllers or views. The functions on
services are also available throughout; they can be accessed in directives, controllers, filters, etc.

For an example of a real world service that I have used in the past…. When creating a select list in HTML for an AngularJS
application, you usually have an ID associated with a selected element from the list. You usually want to do something with
this, maybe display all the properties of the JSON object. In JavaScript, to find this element, you need to loop through all
the elements in an array until you get a match on the key.  Depending on the size of your application, you end up writing this
logic many, many times. What I have done in the past, is write a helper application that creates an array that I can
lookup up an element by key value, thus reducing the need for repetitive array looping.

Generally, there are two ways to create services within your application. The most common is to use the ``module.service`` on
 your application. The second is ``module.factory``. There are a couple of other ways, but we will skip those. AngularJS
 services are really singleton objects. These single objects are then available across your application via dependency
 injection, which we will look at soon.

 The main difference between the two service creation methods is how they are used. The ``module.service`` approach creates an
 instance of a function. A good use case for this approach is the generic array lookup function mentioned above. The
 ``module.factory`` approach is that the returned value is returned by invoking a function reference. This essentially allows you
 to treat the service like a class that you can new to make new instances.


The syntax for ``module.service`` is

```xml
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

```xml
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

```xml
function ChemCtrl($scope, chemistryService)
{
    ...
    $scope.nameFromFactory = chemistryService.elementName(elements[0]);
}
```



