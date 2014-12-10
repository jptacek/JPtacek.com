---
layout: post
title: AngularJS – Introducing ng-repeat
date: 2013-10-31
tags: ["AngularJS","JavaScript","Web"]
---

[AngularJS](http://www.angularjs.org) is a Javascript MVC framework from the fine folks over at
[Google](http://www.google.com). The focus of Angular is building complex
 HTML based client applications. Its design philosophy is data first, where your data will be updating the DOM.
 Contrast this to a framework like JQuery where the DOM will update your data.

![AngularJS Logo](angularLogo.png)

This is the third in a series of posts on AngularJS where we are using Chemistry data from the periodic table
to help us understand the framework. The others posts are

1. [AngularJS - Introduction](http://www.jptacek.com/2013/10/angularjs-introduction/)
2. [AngularJS - Introducing AngularJS Controllers](http://www.jptacek.com/2013/10/introducing-angularjs-controllers/)
3. AngularJS - Introducing NG-Repeat
4. [AngularJS - More with NG-Repeat](http://www.jptacek.com/2014/01/angularjs-further-with-ng-repeat/)
5. [AngularJS - Image Binding](http://www.jptacek.com/2014/01/angularjs-lou-reed/)
6. [AngularJS - Introducing Templates](http://www.jptacek.com/2014/02/angularJS-templates/)
7. [AngularJS - Introducing Routing](http://www.jptacek.com/2014/02/angularJS-IntroToRouting/)
8. [AngularJS - Introduction to Services](http://www.jptacek.com//2014/05/angularJS-Intro-To-Services/)
9. [AngularJS - Introduction to Directives](http://www.jptacek.com/2014/06/angularJS-intro-to-directives/)
10. [AngularJS - Further with Directives](http://www.jptacek.com/2014/12/angularJS-further-with-directives/)

>Note: AngularJS does not allow for more than one ng-app directive. When I have multiple angular posts on
the home page of my blog, only one application will work. I need to refactor the entire site to account for
this. All of that to say this, you are best clicking on a single article so you can see the pages in action.

We have previously talked about AngularJS and controllers. However, an important part of web development is displaying data,
especially repeating data. We are going to use our Periodic data and look at options for displaying that data on the page.

For this example, we have created a chemistry controller that contains information from the periodic table. An element in our
JSON object looks like

```javascript
 "atomicNumber": 1,
 "name": "Hydrogen",
 "atomicWeight": 1.00794,
 "phase": "Gas",
 "ionization": 13.5984,
 "melting": -259.15,
 "boiling": -252.87
```

Our chemistry controller essentially is responsible for setting a local scope variable.

```javascript
function chemCtrl($scope) {

 $scope.periodic = {
 elements: [
 {
 "atomicNumber": 1,
 "name": "Hydrogen",
 "atomicWeight": 1.00794,
 "phase": "Gas",
 "ionization": 13.5984,
 "melting": -259.15,
 "boiling": -252.87
 },

....

 ]
 };
}
```

Our application now has a JavaScript variable on our Angular scope called periodic, which holds all of our
JSON chemistry data. To display this on the page, we want to take advantage of the
[ng-repeat](http://docs.angularjs.org/api/ng.directive:ngRepeat) directive in AngularJS.
The syntax for this is pretty simple. In our example, we will display all of the chemical element names from the
periodic table in an unordered list.

We start our list with a ``ul`` tag. The next step is to apply the ``ng-repeat`` directive to the markup we want to
repeat, in this case, the``li`` tag, in which we will display the name of the element.
The syntax is ``ng-repeat="element in periodic.elements"``. Essentially, ``ng-repeat`` is expecting an expression.
In this instance, we are saying we want to loop through all items in our periodic data source, and we are going to call each
item element, which will be a single item from our JSON object. Last, we need to output the data for display.
In this instance then element's name, which is a property on our JSON object called name.

```xml
<ul>
  <li data-ng-repeat="element in periodic.elements">{{element.name}} </li>
</ul>
```

<div id="ngApp" ng-app="chemistryApp">

    <div id="elements1" ng-controller="chemCtrl" >
        <ul>
            <li ng-repeat="element in periodic.elements">
                {{element.name}}
            </li>
        </ul>
    </div>

We could also go an easily update our markup to display the atomic weight along with the name by changing our ``li``
 display to

```xml
 {{element.name}} - {{element.atomicWeight}}
```



Resulting in a new look, where we are appending the atomic weight to the display of the element's name.

   <div id="elements2" ng-controller="chemCtrl" >
        <ul>
            <li ng-repeat="element in periodic.elements">
                {{element.name}} - {{element.atomicWeight}}
            </li>
        </ul>
    </div>

Looking at our page though, we have a lot of data that we are displaying. Angular has the concept of filters,
which can be applied to our expressions. An example of this is
the [limitTo](http://docs.angularjs.org/api/ng.filter:limitTo) filter. We can limit the number of items we display,
in our scenario to 10\. This is as simple as

```xml
    <li data-ng-repeat="element in periodic.elements|limitTo:10 ">
```

We now our displaying ten results on our page

   <div id="elements2" ng-controller="chemCtrl" >
         <ul>
             <li ng-repeat="element in periodic.elements|limitTo:10">
                 {{element.name}} - {{element.atomicWeight}}
             </li>
         </ul>
     </div>

Angular can also quickly allow the data to be searched using the ``ng-model`` attribute. We create a text input box,
and decorate it with the ``ng-model`` syntax
to define a variable which is available on our scope, and then use that as an input to the filter.

First, we can create the input box

```xml
<input type="text" data-ng-model="elementName"/>
```

Next, we use that as the parameter for our filter instead of limitTo by using the [filter](http://docs.angularjs.org/api/ng.filter:filter) keyword. The syntax for this is

```xml
<li data-ng-repeat="element in periodic.elements ' filter:elementName">
```

We can then type in an element name and the list will narrow down automatically. Give it a try!


   <div id="elements3" ng-controller="chemCtrl" >
    <input type="text" ng-model="elementName"/>
    <div id="elements3" ng-controller="chemCtrl" >
        <ul>
            <li ng-repeat="element in periodic.elements | filter:elementName">
                {{element.name}}
            </li>
        </ul>
    </div>
    </div>

You will notice that this does not REALLY work. What we want to be able to do is filter the name. For example, if
you type 1, you will see results appear, for example Hydrogen. The reason for this is we are filtering on the
WHOLE json object, so when we type 1 we are getting Hydrogen's Atomic number of 1 as a result and Lithium's atomic
weight of 6.941, etc.

![](103113_1053_AngularJSIn7.png)

What we want to be able to do is filter on the JSON object property. I bring this up, because AngularJS, of course, has the ability to do this. This is accomplished by updating our Filter expression to identify the property of the JSON object we want to filter on. For example

```xml
<li data-ng-repeat='element in periodic.elements ' filter:{name:elementNameOnly}'>
```

Note, there appears to be a bug in the current version of AngularJS, 1.0.8, where you need to initialize the filter. Using the current release candidate, 1.2, resolves this issue. Thanks to my Skyline Technologies colleague [Berny Zamora](https://twitter.com/bernyzamora) for helping me chase that down.

Now when we type 1, we no longer see results now.

   <div id="elements4" ng-controller="chemCtrl" >
    <input type="text" ng-model="elementNameOnly"/>
        <ul>
            <li ng-repeat="element in periodic.elements | filter:{name:elementNameOnly}">
                {{element.name}}
            </li>
        </ul>
    </div>



I have created an Azure Website to host all of this code at [http://angularperiodic.azurewebsites.net/](http://angularperiodic.azurewebsites.net/)

The code is also available on [GitHub](https://github.com/jptacek/AngularPeriodic)
</div>


<script type="text/javascript" src="/2013/10/angularjs-introducing-ng-repeat/js/chemistryApp.js"></script>
<script type="text/javascript" src="/2013/10/angularjs-introducing-ng-repeat/js/chemistryController.js"></script>
<script type="text/javascript" src="/2014/02/angularJS-templates/js/chemistry.js"></script>