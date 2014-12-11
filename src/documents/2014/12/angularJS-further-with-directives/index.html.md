---
layout: post
title: AngularJS - Further with Directives
date: 2014-12-10
tags: ["AngularJS","JavaScript","Web"]
---
 
[AngularJS](http://www.angularjs.org) is a Javascript MVC framework from the fine folks over at
[Google](http://www.google.com). The focus of Angular is building complex
 HTML based client applications. Its design philosophy is data first, where your data will be updating the DOM.
 Contrast this to a framework like JQuery where the DOM will update your data.

![AngularJS Logo](angularLogo.png)

This is the tenth (I know, right!!?!!?!) in a series of posts on AngularJS where we are using Chemistry data from the periodic table
to help us understand the framework. The others posts are

1. [AngularJS - Introduction](http://www.jptacek.com/2013/10/angularjs-introduction/)
2. [AngularJS - Introducing AngularJS Controllers](http://www.jptacek.com/2013/10/introducing-angularjs-controllers/)
3. [AngularJS - Introducing NG-Repeat](http://www.jptacek.com/2013/10/angularjs-introducing-ng-repeat/)
4. [AngularJS - More with NG-Repeat](http://www.jptacek.com/2014/01/angularjs-further-with-ng-repeat/)
5. [AngularJS - Image Binding](http://www.jptacek.com/2014/01/angularjs-lou-reed/)
6. [AngularJS - Introducing Templates](http://www.jptacek.com/2014/02/angularJS-templates/)
7. [AngularJS - Introducing Routing](http://www.jptacek.com/2014/02/angularJS-IntroToRouting/)
8. [AngularJS - Introduction to Services](http://www.jptacek.com/2014/05/angularJS-Intro-To-Services/)
9. [AngularJS - Introduction to Directives](http://www.jptacek.com/2014/06/angularJS-intro-to-directives/)
10. AngularJS - Further with Directives

>Note: AngularJS does not allow for more than one ng-app directive. When I have multiple angular posts on
the home page of my blog, only one application will work. I need to refactor the entire site to account for
this. All of that to say this, you are best clicking on a single article so you can see the pages in action.

Previously, we took an introductory look at directives. This time we will go a bit deeper.

In our previous example, we displayed data from the periodic table, specifically, the atomic weight, atomic number
and element name. Our data source, has a lot more information, such as boiling and melting points, density, etc. In
this example, we will expand the directive by enabling a click event to display expanded data about the selected element.

The first thing to mention is scope. Scope, as we have already seen, is the magical tool that Angular uses to 
communicate between your view and services, etc. By default, a directive does not get a new child scope, but
uses the parent scope. So, in our case, when the directive is inside a controller, it will use the 
controller's scope.

To get access to the scope, we can use the ``link`` function. The ``link`` function gets called every time the 
element gets bound to the data in the ``$scope`` object. In general, ``link`` is used to manipulate the Document
Object Model (DOM),
either by adding event listeners or updating the DOM.

The link function takes three arguments:

* ``scope`` - Scope gets passed to the directive. This is generally the scope of the calling controller
* ``elem`` - The element on which the directive is derived. In our case, it will be the template markup for
the chemical element
* ``attrs`` - Attributes associated with our element

It is worth noting that AngularJS ships with jQLite, which is a subset of the full 
[jQuery](http://jquery.com/) library. If you are using full
jQuery within your web app, then that will be used instead. All of that to say this, you access DOM elements 
similarly as you do in jQuery, and since jQuery is already wrapped, you don't need to use your old school
``$`` for access.

In our example, we are going to use the ``link`` function to manipulate the DOM. First, let us take a look
at the JavaScript

```javascript
chemistryApp.directive('periodicChartElement', function (chemistryService) {;
    return {
        restrict: 'E',
        templateUrl: './template/periodic-template.html',
        link: function (scope, elem, attrs) {
            elem.bind('click', function() {
                // Change state
                scope.$apply(function(){
                    scope.fullElement = !(scope.fullElement);
                });

            });
            elem.bind('mouseover', function() {
                elem.css('cursor', 'pointer');
            });

        },
        scope:{
            element:'='
        }

    }

});
```

With the exception of adding the link function, things are pretty similar to before. The link function does several 
pieces of functionality that are worth nothing though.

First, we bind a click event to our chemical element. When
that click event is called, we update a boolean variable on our scope, which is our parent scope from the calling 
controller and set it to the opposite. Second, we also bind a mouseover event to manipulate our CSS to change the 
 cursor to a pointer. As you can see, this is an elegant way to add event behavior to our directive.
 
Our template has now also been updated. The boolean scope variable that we update on the click event, 
``fullElement`` is used to show one of two different
HTML "paths" in our template, one shows a small subset of data, the other a larger subset of data from the periodic 
table. 

```xml
<div class='periodicCell {{element.cssForDisplay}}' data-ng-hide="fullElement">
    <div class="atomicNumber">{{element.atomicNumber}}</div><div class="atomicWeight">{{element.atomicWeight}}</div>
    <div class="atomicSymbol">{{element.symbol}}</div>
    <div class="centerElementDisplay">{{element.name }}</div>
</div>
<div class='periodicPop {{element.cssForDisplay}}'  data-ng-show="fullElement">
    <div class="atomicNumberPop">{{element.atomicNumber}}</div>
    <div class="atomicWeightPop">{{element.atomicWeight}}</div>
    <div class="atomicSymbolPop">{{element.symbol}}</div>
    <div class="density">{{element.density || '-'}}</div>
    <div class="meltingPoint">{{element.melting + 273.15|number:2}}</div>
    <div class="boilingPoint">{{element.boiling + 273.15|number:2}}</div>
    <div class="elecConfig">{{element.elecconfig }}</div>
    <div class="elctroNeg">{{element.electronegativity}}</div>
    <div class="centerElementDisplayPop">{{element.name }}</div>

</div>
```

It is also worth talking a bit about scope in directives. As we mentioned earlier, by default, you are binding to the parent scope of the controller.
In many instances this will work well, but if you want to display your directive more than once on a page, you would need a 
controller for each directive. That is no good. 

AngularJS introduces the ability to create an isolated scope, which is what we are doing in our example. This allows us
to use our directive multiple times on the same page. There are binding options in setting up the directive variables that we should
briefly touch on.

The various options for
setting up variables in the directive scope are:

* ``=`` - Set up two way binding between the parent scope and our isolated scope
* ``@`` - Set up one way binding between the parent scope adn the isolate scope
* ``&`` - Allows to bind to parent scope functions

Dan Wahlin has done an outstanding job on his blog of digging in deeper into directives and scope. His articles are at

1. [Creating Custom AngularJS Directives Part I – The Fundamentals](http://weblogs.asp.net/dwahlin/creating-custom-angularjs-directives-part-i-the-fundamentals)
2. [Creating Custom AngularJS Directives Part 2 – Isolate Scope](http://weblogs.asp.net/dwahlin/creating-custom-angularjs-directives-part-2-isolate-scope)
3. [Creating Custom AngularJS Directives Part 3 - Isolate Scope and Function Parameters](http://weblogs.asp.net/dwahlin/creating-custom-angularjs-directives-part-3-isolate-scope-and-function-parameters)
4. [Creating Custom AngularJS Directives Part 4 - Transclusion and Restriction](https://weblogs.asp.net/dwahlin/creating-custom-angularjs-directives-part-4-transclusion-and-restriction)
7. [Creating Custom AngularJS Directives Part 7 – Creating a Unique Value Directive using $asyncValidators](https://weblogs.asp.net/dwahlin/creating-custom-angularjs-directives-part-7-%E2%80%93-creating-a-unique-value-directive-using-asyncvalidators)

Parts 5 and 6 should be coming too.

We also have updated our page to show multiple elements to demonstrate a single directive interacting with unique scope. It
is not very robust, so picking items at the end, aka Curium, will cause some issues.

<div id="app" ng-app="chemistryApp">
    <div id="controller" ng-controller="chemistryController">

        <div class="row">
            <select ng-model="periodicElement" ng-options="e.name for e in elements"
                    ng-click="updateController(periodicElement)"></select><br/>
        </div>
        <div class="row">
            &nbsp;
        </div>
        <div class="row">
            &nbsp;
        </div>
        <div class="row">
            <div class="col-md-2">
                <periodic-chart-element element="periodicElement" ></periodic-chart-element>
            </div>
            <div class="col-md-2">
                &nbsp;
            </div>
            <div class="col-md-2">
                <periodic-chart-element element="elements[periodicElement.atomicNumber]"  ></periodic-chart-element>
            </div>
            <div class="col-md-2">
                &nbsp;
            </div>
            <div class="col-md-2">
                <periodic-chart-element element="elements[periodicElement.atomicNumber+1]"></periodic-chart-element>
            </div>
        </div>
    </div>
</div>

<br/>

So to recap, with directives we have created our HTML markup element ``periodic-chart-element`` where we can put multiple elements
onto a single page by updating our directive to use its own version of scope.

It has been several months since my last Angular blog post. More are coming. I have a plan for all of this, ultimately we
will create an application that is the periodic table, done AngularJS style.

You can either visit [http://angularperiodic.azurewebsites.net/](http://angularperiodic.azurewebsites.net/) to see the code in action and
as always find the code out on [GitHub](https://github.com/jptacek/AngularPeriodic).

Thanks for reading!



<script type="text/javascript" src="/2014/12/angularJS-further-with-directives/js/chemistryApp.js"></script>
<script type="text/javascript" src="/2014/12/angularJS-further-with-directives/js/chemistryController.js"></script>
<script type="text/javascript" src="/2014/12/angularJS-further-with-directives/js/chemistryService.js"></script>
<script type="text/javascript" src="/2014/12/angularJS-further-with-directives/js/chemistryDirective.js"></script>


