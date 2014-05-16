---
layout: post
title: AngularJS - Introducing Routes
date: 2014-02-25
tags: ["AngularJS","JavaScript","Web"]
---


[AngularJS](http://www.angularjs.org) is a Javascript MVC framework from the fine folks over at
[Google](http://www.google.com). The focus of Angular is building complex
 HTML based client applications. Its design philosophy is data first, where your data will be updating the DOM.
 Contrast this to a framework like JQuery where the DOM will update your data.

![AngularJS Logo](angularLogo.png)

This is the seventh in a series of posts on AngularJS where we are using Chemistry data from the periodic table
to help us understand the framework. The others posts are

1. [AngularJS - Introduction](http://www.jptacek.com/2013/10/angularjs-introduction/)
2. [AngularJS - Introducing AngularJS Controllers](http://www.jptacek.com/2013/10/introducing-angularjs-controllers/)
3. [AngularJS - Introducing NG-Repeat](http://www.jptacek.com/2013/10/angularjs-introducing-ng-repeat/)
4. [AngularJS - More with NG-Repeat](http://www.jptacek.com/2014/01/angularjs-further-with-ng-repeat/)
5. [AngularJS - Image Binding](http://www.jptacek.com/2014/01/angularjs-lou-reed/)
6. [AngularJS - Introducing Templates](http://www.jptacek.com/2014/02/angularJS-templates/)
7. AngularJS - Introducing Routing

Note: AngularJS does not allow for more than one ng-app directive. I need to refactor the entire site to account for
this. All of that to say this, you are best clicking on a single article so you can see the pages in action.

AngularJS is, at its heart, a Single Page Application (SPA) platform. While you can use it in
many ways for client side development, it is great for SPA apps, and that means routing. In
this post, we will introduce AnuglarJS routing. More information can be found at the
[official site](http://docs.angularjs.org/api/ngRoute/service/$route) on routing.

Routes are a way for multiple views to be used within a single HTML page. This enables you
page to look more "app-like" because users are not seeing page reloads happen within the
browser. To setup a page for routing there are several steps, but nothing overly difficult.

First, AngularJS requires a service, the [route service](http://docs.angularjs.org/api/ngRoute/service/$route),
which is not part of the default Angular library. You will need to load a separate
javascript file, ``angular-route.js``, as part of your script loading. This file can be downloaded as part of minified
file from the [AngularJS.Org](http://www.angularjs.org) site or via CDN. After downloading, we update our
scripts reference to include the routing file as so


```xml
<script type="text/javascript" src="../js/lib/angular-route.min.js"></script>
```

Second, this is our first non-trivial look at the Dependency Injection model in Angular.
Angular's Dependency Injection model is crazy slick. When the application starts up, an
injector is created that is responsible for loading modules. The injector is unaware of
any of our services until we inject them. To take advantage of this, we inject the route service
when we create our app module via a parameter. Our app.js now looks like

```javascript
'use strict';

var chemistryApp = angular.module('chemistryApp', ['ngRoute']));

```

We will be digging deeper into Dependency Injection down the road, but for now it is enough
to ensure we pass in our ``ngroute`` parameter, which ensures that AngularJS will load the
route service.

The next step is to create the routes for our application. For us, we are going to create
two routes. The first shows our list of chemical elements, and the second is responsible
for displaying details about a given chemical element. The way the routes work, we do a
couple of things. First, identify the url that we will be routing. This the HTML # (hashtag) standard
to allow us to navigate within the page. While not 100% required, it IS needed for old browsers that
don't support the new HTML 5 standard. If you are so inclined, you can setup the
route to bypass this with ``$locationProvider.html5Mode(true)``. For our example, the URL for a list will be
``http://site/#/chemlist``. Once we have the URL we are mapping to, we define two other
items. The first is the controller that the route maps to, in our case ``chemListCtrl`` and
then finally the templateURL for our HTML fragment that will be loaded\injected into a view container
on our page.

We also want to identify a route for a given chemical element, essentially a master-detail
approach. This is done by creating a second route where we identify a parameter on the URL that can then
be used to retrieve an array element. For our example, we will take the ``atomicNumber`` and pass it to
a second controller that is responsible for loading a chemical element from our array and making it available
to a detail view.

Both of these routes are then chained to our creation of our app like so

```javascript
'use strict';

var chemistryApp = angular.module('chemistryApp', ['ngRoute']).
    config(function($routeProvider) {
        $routeProvider
            .when('/', {
                templateUrl:'templates/chemList.html',
                controller: 'chemListCtrl'
            }).when('/chemList/:atomicNumber', {
                templateUrl:'templates/chemItem.html',
                controller: 'chemItemCtrl'
            })
            .otherwise({redirectTo: '/'});
    });
```

Notice, we define a default route for when we are unable to match on a URL.

The next step, other than actually creating our controllers and HTML views is to add
a view to our page markup for Angular to inject our template into. That is as simple as

```xml
        <data-ng-view></data-ng-view>

```

Our controllers and templates are very similar to what we have done before. Our controller class is now


```javascript
chemistryApp.controller('chemListCtrl',
    function chemCtrl($scope) {
        $scope.periodic = periodicData;
    }
).controller('chemItemCtrl',
    function chemCtrl($scope, $log,$routeParams) {
        var elementNumber  = $routeParams.atomicNumber;
        for (var i=0;i<periodicData.elements.length;i++) {
            if (periodicData.elements[i].atomicNumber == elementNumber) {
                $scope.element = periodicData.elements[i];
                break;
            }
        }

    }
);

```

The most interesting thing to note is that we are now injecting a ``$routeparams`` variable
when creating our controller for the view we use for an individual item. This allows us to get the parameter for the ID
from the route. For example, the url ``http://site/#/chemList/:5`` allows us to grab the
parameter for the atomic number using a statement such as ``var elementNumber  = $routeParams.atomicNumber;``.

Just to give a quick look at the template and how we form our URL, the template that builds the list is

```xml
<div id="elements1" ng-controller="chemListCtrl" class="container">
        <ul>
            <li ng-repeat="element in periodic.elements">
                <a ng-href="#/chemList/{{element.atomicNumber}}">{{element.name}}</a>
            </li>
        </ul>
</div>
```


Now, we are dynamically loading data and swapping views based on the route we select. Very
nice!

Watch it in action
<div id="app" ng-app="chemistryApp">
<a href="./#/chemList">List</a>
<br/>
        <ng-view></ng-view>
</div>

<p></p>

You can either visit [http://angularperiodic.azurewebsites.net/](http://angularperiodic.azurewebsites.net/) to see the code in action and
as always find the code out on [GitHub](https://github.com/jptacek/AngularPeriodic)


<script type="text/javascript" src="/2014/02/angularJS-IntroToRouting/js/chemistryApp.js"></script>
<script type="text/javascript" src="/2014/02/angularJS-IntroToRouting/js/chemistryController.js"></script>
<script type="text/javascript" src="/2014/02/angularJS-IntroToRouting/js/chemistry.js"></script>