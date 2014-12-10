---
layout: post
title: AngularJS - More with ng-repeat
date: 2014-01-23
tags: ["AngularJS","JavaScript","Web"]
---
 <style>
        .tableOdd {
            background-color: green;
        }
        .tableEven {
            background-color: gold;
        }
    </style>

[AngularJS](http://www.angularjs.org) is a Javascript MVC framework from the fine folks over at
[Google](http://www.google.com). The focus of Angular is building complex
 HTML based client applications. Its design philosophy is data first, where your data will be updating the DOM.
 Contrast this to a framework like JQuery where the DOM will update your data.

![AngularJS Logo](angularLogo.png)

This is the fourth in a series of posts on AngularJS where we are using Chemistry data from the periodic table
to help us understand the framework. The others posts are

1. [AngularJS - Introduction](http://www.jptacek.com/2013/10/angularjs-introduction/)
2. [AngularJS - Introducing AngularJS Controllers](http://www.jptacek.com/2013/10/introducing-angularjs-controllers/)
3. [AngularJS - Introducing NG-Repeat](http://www.jptacek.com/2013/10/angularjs-introducing-ng-repeat/)
4. AngularJS - More with NG-Repeat
5. [AngularJS - Image Binding](http://www.jptacek.com/2014/01/angularjs-lou-reed/)
6. [AngularJS - Introducing Templates](http://www.jptacek.com/2014/02/angularJS-templates/)
7. [AngularJS - Introducing Routing](http://www.jptacek.com/2014/02/angularJS-IntroToRouting/)
8. [AngularJS - Introduction to Services](http://www.jptacek.com//2014/05/angularJS-Intro-To-Services/)
9. [AngularJS - Introduction to Directives](http://www.jptacek.com/2014/06/angularJS-intro-to-directives/)
10. [AngularJS - Further with Directives](http://www.jptacek.com/2014/12/angularJS-further-with-directives/)

>Note: AngularJS does not allow for more than one ng-app directive. When I have multiple angular posts on
the home page of my blog, only one application will work. I need to refactor the entire site to account for
this. All of that to say this, you are best clicking on a single article so you can see the pages in action.

In this post, we are going to dig a bit deeper into ng-repeat and discover a few things.

To level set, we have a controller called chemistryApp.js. This creates our AngularJS application

*chemistryApp.js*

```javascript
var chemistryApp = angular.module('chemistryApp', []);
```

and a controller that references are json file of chemistry data and sets it to a scope variable

*chemistryController.js*

```javascript
chemistryApp.controller('chemCtrl',
    function chemCtrl($scope) {
        $scope.periodic = perioicData;
    }
);

```

First up, instead of creating an unordered list, we are going to create a table. This is done by putting the
``ng-repeat`` directive on a ``<tr>`` tag. For example

```xml
 <tr data-ng-repeat="element in periodic.elements ">
```

Then we can add our data on a cell by cell basis. For this example, we are going to link to a Wikipedia article about
each element, and then display things like the atomic number, atomic weight, etc. Tying this with our ``ng-repeat``
 directove and
our table markup becomes

```xml
<table class="table table-striped table-bordered table-hover table-condensed">
            <tr>
                <th>Name</th><th>Atomic Number</th><th>Weight</th><th>Phase</th><th>Ionization Energy</th><th>Melting Point</th><th>Boiling</th>
            </tr>
            <tr data-ng-repeat="element in periodic.elements ">
                <td><a href="http://en.wikipedia.org/wiki/{{element.name}}" Title="Wikipedia article on {{element.name}}" target="_top">{{element.name}}</a></td>
                <td>{{element.atomicNumber}}</td>
                <td>{{element.atomicWeight}}</td>
                <td>{{element.phase}}</td>
                <td>{{element.ionization}}</td>
                <td>{{element.melting}}</td>
                <td>{{element.boiling}}</td>
            </tr>
        </table>
```

We now have a list of the Chemical elements in a table.

<div id='appContainer' ng-app="chemistryApp">
 <div id="periodicTable0"  ng-controller="chemCtrl" >
        <table class="table table-striped table-bordered table-hover table-condensed">
            <tr>
                <th>Name</th><th>Atomic Number</th><th>Weight</th><th>Phase</th><th>Ionization Energy</th><th>Melting Point</th><th>Boiling</th>
            </tr>
            <tr ng-repeat="element in periodic.elements ">
                <td><a href="http://en.wikipedia.org/wiki/{{element.name}}" Title="Wikipedia article on {{element.name}}" target="_top">{{element.name}}</a></td>
                <td>{{element.atomicNumber}}</td>
                <td>{{element.atomicWeight}}</td>
                <td>{{element.phase}}</td>
                <td>{{element.ionization}}</td>
                <td>{{element.melting}}</td>
                <td>{{element.boiling}}</td>
            </tr>
        </table>
    </div>

We can also, just like in our previous example, bind a filter to an input box and search for a chemical element
by name and have it filter the list automatically.

```xml
   <div id="periodicTable"  data-ng-controller="chemCtrl" >
        <input type="text" data-ng-model="elementNameOnlyTable"/>
        <table class="table table-striped table-bordered table-hover table-condensed">
            <tr>
                <th>Name</th><th>Atomic Number</th><th>Weight</th><th>Phase</th><th>Ionization Energy</th><th>Melting Point</th><th>Boiling</th>
            </tr>
            <tr data-ng-repeat="element in periodic.elements | filter:{name:elementNameOnlyTable}">
                <td><a href="http://en.wikipedia.org/wiki/{{element.name}}" Title="Wikipedia article on {{element.name}}" target="_top">{{element.name}}</a></td>
                <td>{{element.atomicNumber}}</td>
                <td>{{element.atomicWeight}}</td>
                <td>{{element.phase}}</td>
                <td>{{element.ionization}}</td>
                <td>{{element.melting}}</td>
                <td>{{element.boiling}}</td>
            </tr>
        </table>
    </div>
 ```


 <div id="periodicTable"  ng-controller="chemCtrl" >
    <form id="frm1">
    <input type="text" ng-model="elementNameOnlyTable"/>
    <table class="table table-striped table-bordered table-hover table-condensed">
        <tr>
            <th>Name</th><th>Atomic Number</th><th>Weight</th><th>Phase</th><th>Ionization Energy</th><th>Melting Point</th><th>Boiling</th>
        </tr>
        <tr ng-repeat="element in periodic.elements | filter:{name:elementNameOnlyTable}">
            <td><a href="http://en.wikipedia.org/wiki/{{element.name}}" Title="Wikipedia article on {{element.name}}" target="_top">{{element.name}}</a></td>
            <td>{{element.atomicNumber}}</td>
            <td>{{element.atomicWeight}}</td>
            <td>{{element.phase}}</td>
            <td>{{element.ionization}}</td>
            <td>{{element.melting}}</td>
            <td>{{element.boiling}}</td>
        </tr>
    </table>
    </form>
</div>


The ng-repeat also has some intrinsic variable definitions. One is ``$index`` which is the current key of the element
of the loop you are on.


 <div id="periodicTable1"  ng-controller="chemCtrl" >
        <input type="text" ng-model="elementNameOnlyTable2"/>
        <table class="table table-striped table-bordered table-hover table-condensed">
            <tr>
                <th>Name</th><th>$Index</th><th>Atomic Number</th><th>Weight</th><th>Phase</th><th>Ionization Energy</th><th>Melting Point</th><th>Boiling</th>
            </tr>
            <tr ng-repeat="element in periodic.elements | filter:{name:elementNameOnlyTable2}">
                <td><a href="http://en.wikipedia.org/wiki/{{element.name}}" Title="Wikipedia article on {{element.name}}" target="_top">{{element.name}}</a></td>
                <td>{{$index}}</td>
                <td>{{element.atomicNumber}}</td>
                <td>{{element.atomicWeight}}</td>
                <td>{{element.phase}}</td>
                <td>{{element.ionization}}</td>
                <td>{{element.melting}}</td>
                <td>{{element.boiling}}</td>
            </tr>
        </table>
    </div>


It is interesting to note that the index is for the values you are filtering on too. So if you were to type Aluminum
you will see it becomes the zero element, instead of Hydrogen.

Angular also has  directives like ``ng-hide``,
``ng-show`` and ``ng-class`` along with a [plethora of other attributes](http://docs.angularjs.org/guide/directive).

We can use these in conjunctions with ``$index``. This is really the key step along the journey in thinking the "Angular way".
You don't want to update the dom via javascript, but use Angular to control what is displayed
on your page. As an example of this, let's say we want to hide
every other element in the list. We could do something like

```xml
 <tr data-ng-repeat="element in periodic.elements" data-ng-hide="$index%2">
```

<div id="periodicTable2"  ng-controller="chemCtrl" >
    <table class="table ">
        <tr>
            <th>Name</th><th>Atomic Number</th><th>Weight</th><th>Phase</th><th>Ionization Energy</th><th>Melting Point</th><th>Boiling</th>
        </tr>
        <tr ng-repeat="element in periodic.elements" ng-hide="$index%2">
            <td><a href="http://en.wikipedia.org/wiki/{{element.name}}" Title="Wikipedia article on {{element.name}}" target="_top">{{element.name}}</a></td>
            <td>{{element.atomicNumber}}</td>
            <td >{{element.atomicWeight}}</td>
            <td>{{element.phase}}</td>
            <td>{{element.ionization}}</td>
            <td>{{element.melting}}</td>
            <td>{{element.boiling}}</td>
         </tr>
     </table>
</div>

We can also perform some Crimes Against web design. For example, nothing is uglier than wrapping your table in
Green Bay Packer colors of Green and Gold. So I can add CSS elements like
```xml
<style>
        .tableOdd {
            background-color: green;
        }
        .tableEven {
            background-color: gold;
        }
    </style>
```

Then we can use the ``ng-class`` on the ``<tr>`` we are binding to in order to make even/odd rows change colors.


```xml
<tr data-ng-repeat="element in periodic.elements" data-ng-class="{tableEven: !($index%2), tableOdd: ($index%2)}">
```

It doesn't look pretty, and there are MUCH better ways to do this, but it gives you an example of how to
think the "Angular way"

 <div id="periodicTable3"  ng-controller="chemCtrl" >
        <table class="table ">
            <tr>
                <th>Name</th><th>Atomic Number</th><th>Weight</th><th>Phase</th><th>Ionization Energy</th><th>Melting Point</th><th>Boiling</th>
            </tr>
            <tr ng-repeat="element in periodic.elements" ng-class="{tableEven: !($index%2), tableOdd: ($index%2)}">
                <td><a href="http://en.wikipedia.org/wiki/{{element.name}}" Title="Wikipedia article on {{element.name}}" target="_top">{{element.name}}</a></td>
                <td>{{element.atomicNumber}}</td>
                <td >{{element.atomicWeight}}</td>
                <td>{{element.phase}}</td>
                <td>{{element.ionization}}</td>
                <td>{{element.melting}}</td>
                <td>{{element.boiling}}</td>
            </tr>
        </table>
    </div>

Last, we can also do fun things like sort by using select lists to quickly filter data. For example, we create a
dropdown list for both the element phase

```xml
 <select data-ng-model="elementPhase">
            <option value="">All</option>
            <option value="Gas">Gas</option>
            <option value="Solid">Solid</option>
            <option value="Liquid">Liquid</option>
            <option value="Synthetic">Synthetic</option>
        </select>
```

and an ordering criteria

```xml
<select data-ng-model="elementOrder">
            <option value="name" selected>Name (ascending)</option>
            <option value="-name">Name (descending)</option>
            <option value="melting">Melting Point (asc)</option>
            <option value="-melting">Melting Point (desc)</option>
        </select>
```

We can then use the ``ng-filter`` and ``ng-order`` directives to filter and sort our table. Further, we can
combine with our text box for searching by name and chain them together.

```xml
 <tr data-ng-repeat="element in periodic.elements | filter:{name:elementName} | filter:{phase:elementPhase} | orderBy:elementOrder">
```

Ultimately, our HTML looks like

```xml
<div id="periodicTable5"  data-ng-controller="chemCtrl" >
        Element Name:<input type="text" data-ng-model="elementName"/>
        &nbsp;State:
        <select data-ng-model="elementPhase">
            <option value="">All</option>
            <option value="Gas">Gas</option>
            <option value="Solid">Solid</option>
            <option value="Liquid">Liquid</option>
            <option value="Synthetic">Synthetic</option>
        </select>
        &nbsp;Order:
        <select data-ng-model="elementOrder">
            <option value="name" selected>Name (ascending)</option>
            <option value="-name">Name (descending)</option>
            <option value="melting">Melting Point (asc)</option>
            <option value="-melting">Melting Point (desc)</option>
        </select>

        <table class="table ">
            <tr>
                <th>Name</th><th>Atomic Number</th><th>Weight</th><th>Phase</th><th>Ionization Energy</th><th>Melting Point</th><th>Boiling</th>
            </tr>
            <tr data-ng-repeat="element in periodic.elements | filter:{name:elementName} | filter:{phase:elementPhase} | orderBy:elementOrder">
            <td><a href="http://en.wikipedia.org/wiki/{{element.name}}" Title="Wikipedia article on {{element.name}}" target="_top">{{element.name}}</a></td>
                <td>{{element.atomicNumber}}</td>
                <td >{{element.atomicWeight}}</td>
                <td>{{element.phase}}</td>
                <td>{{element.ionization}}</td>
                <td>{{element.melting}}</td>
                <td>{{element.boiling}}</td>
            </tr>
        </table>
    </div>
```

<div id="periodicTable5"  ng-controller="chemCtrl" >
        Element Name:<input type="text" ng-model="elementName"/>
        &nbsp;State:
        <select ng-model="elementPhase">
            <option value="">All</option>
            <option value="Gas">Gas</option>
            <option value="Solid">Solid</option>
            <option value="Liquid">Liquid</option>
            <option value="Synthetic">Synthetic</option>
        </select>
        &nbsp;Order:
        <select ng-model="elementOrder">
            <option value="name" selected>Name (ascending)</option>
            <option value="-name">Name (descending)</option>
            <option value="melting">Melting Point (asc)</option>
            <option value="-melting">Melting Point (desc)</option>
        </select>

        <table class="table ">
            <tr>
                <th>Name</th><th>Atomic Number</th><th>Weight</th><th>Phase</th><th>Ionization Energy</th><th>Melting Point</th><th>Boiling</th>
            </tr>
            <tr ng-repeat="element in periodic.elements | filter:{name:elementName} | filter:{phase:elementPhase} | orderBy:elementOrder">
            <td><a href="http://en.wikipedia.org/wiki/{{element.name}}" Title="Wikipedia article on {{element.name}}" target="_top">{{element.name}}</a></td>
                <td>{{element.atomicNumber}}</td>
                <td >{{element.atomicWeight}}</td>
                <td>{{element.phase}}</td>
                <td>{{element.ionization}}</td>
                <td>{{element.melting}}</td>
                <td>{{element.boiling}}</td>
            </tr>
        </table>
    </div>

The interesting thing to note about this too is that this page is pretty heavy. It has many tables with the
Periodic elements. However, by using client side code, we download all of the elements only once when we get
our JavaScript file. The client side functionality does the page building, helping the page load quicker.

For those of you who have been web coding for a while, these few number of lines to have all of this client side
functionality is magic. Seriously, magic.


You can either visit [http://angularperiodic.azurewebsites.net/](http://angularperiodic.azurewebsites.net/) to see the code in action and
as always find the code out on [GitHub](https://github.com/jptacek/AngularPeriodic)
</div>
 <script type="text/javascript" src="/2014/01/angularjs-further-with-ng-repeat/js/chemistryApp.js"></script>
 <script type="text/javascript" src="/2014/01/angularjs-further-with-ng-repeat/js/chemistryController.js"></script>
 <script type="text/javascript" src="/2014/01/angularjs-further-with-ng-repeat/js/chemistry.js"></script>