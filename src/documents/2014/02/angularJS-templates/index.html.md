---
layout: post
title: AngularJS - Introducing Templates
date: 2014-02-10
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

This is the sixth in a series of posts on AngularJS. The others are
1. [AngualrJS - Introduction](http://www.jptacek.com/2013/10/angularjs-introduction/)
2. [AngularJS - Introducing AngularJS Controllers](http://www.jptacek.com/2013/10/introducing-angularjs-controllers/)
3. [AngularJS - Introducing NG-Repeat](http://www.jptacek.com/2013/10/angularjs-introducing-ng-repeat/)
4. [AngularJS - More with NG-Repeat](http://www.jptacek.com/2014/01/angularjs-further-with-ng-repeat/)
5. [Image Binding with AngularJS](http://www.jptacek.com/2014/01/angularjs-lou-reed/)

AngularJS has a lot of great features for working with HTML that allows you to split up development when you are
doing team projects. The binding approach and directives allows for a nice separation between developers and
designers. Another great piece of the platform is the ability to separate out HTML that you are using over and
over again into a template file that can then be called by multiple different pages.

In our previous example, we were consistently displaying the same repeatable line in our ``ng-repeat`` directive.
This is a great example of repeatable markup that we can have and reference in a single place.

To do this, we take our HTML line we were using for the data binding.

```xml
    <td><a href="http://en.wikipedia.org/wiki/{{element.name}}" Title="Wikipedia article on {{element.name}}" target="_top">{{element.name}}</a></td>
            <td>{{element.atomicNumber}}</td>
            <td >{{element.atomicWeight}}</td>
            <td>{{element.phase}}</td>
            <td>{{element.ionization}}</td>
            <td>{{element.melting}}</td>
            <td>{{element.boiling}}</td>
```

and we move it into a separate HTML file, in our case we will call it element1.html. Since we are only dealing with a
fragment of HTML, we only want to include the markup we will use for binding, and no other semantically correct
markup like the HTML header, etc.

In our controller file, we setup an object that identifies the path to our template as in the following code line

```xml
$scope.template =  {name: 'template1.html', url: 'js/templates/element1.html'};
```

Within the HTML page, we then reference the template file using the ng-include directive like so

```xml
   <tr data-ng-repeat="element in periodic.elements | filter:{name:elementNameOnlyTable}" data-ng-include="template.url">
```

Our page then renders the same as before, but we can now use the template in multiple places. For large teams, a most
excellent added benefit is you have removed contention issues on the file.

<div id="app" ng-app="chemistryApp">
<div id="periodicTable"  ng-controller="chemTemplateCtrl1" >
    <form id="frmChem">
    <input type="text" ng-model="elementNameOnlyTable"/>
    <table class="table table-striped table-bordered table-hover table-condensed">
        <tr>
            <th>Name</th><th>Atomic Number</th><th>Weight</th><th>Phase</th><th>Ionization Energy</th><th>Melting Point</th><th>Boiling</th>
        </tr>
        <tr ng-repeat="element in periodic.elements | filter:{name:elementNameOnlyTable}" ng-include="template.url">
        {{$$index}}
        </tr>
    </table>
    </form>
</div>

Since we our look and feel is controlled by templates, we can also have programmatic control over the look and feel.
In our last post, we had committed crimes against web design by using Packer colors.

We can do something similar here by having a second template get loaded by our page. To do this, we update our
controller to have an array of templates, and choose which one we want, in this case, ugly Green and Gold.

```xml
controller('chemTemplateCtrl2',
    function chemCtrl($scope) {
        $scope.periodic = perioicData;

        $scope.templates =
            [ { name: 'template1.html', url: 'js/templates/element1.html'}
                , { name: 'template2.html', url: 'js/templates/element2.html'}];
        $scope.template = $scope.templates[1];

    }
```

Our table now looks even more unattractive

<div id="app" ng-app="chemistryApp">
<div id="periodicTable"  ng-controller="chemTemplateCtrl2" >
    <form id="frmChem">
    <input type="text" ng-model="elementNameOnlyTable"/>
    <table class="table table-striped table-bordered table-hover table-condensed">
        <tr>
            <th>Name</th><th>Atomic Number</th><th>Weight</th><th>Phase</th><th>Ionization Energy</th><th>Melting Point</th><th>Boiling</th>
        </tr>
        <tr ng-repeat="element in periodic.elements | filter:{name:elementNameOnlyTable}" ng-include="template.url">
        {{$$index}}
        </tr>
    </table>
    </form>
</div>

Finally, since we have an array, we can dynamically change the look and feel on the fly using a drop down list. For
example,
</div>
<script type="text/javascript" src="/2014/02/angularJS-templates/js/chemistryApp.js"></script>
<script type="text/javascript" src="/2014/02/angularJS-templates/js/chemistryController.js"></script>
<script type="text/javascript" src="/2014/02/angularJS-templates/js/chemistry.js"></script>