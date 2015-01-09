---
layout: post
title: AngularJS - Introducing Templates
date: 2014/02/10
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

This is the sixth in a series of posts on AngularJS where we are using Chemistry data from the periodic table
to help us understand the framework. The others posts are

1. [AngularJS - Introduction](http://www.jptacek.com/2013/10/angularjs-introduction/)
2. [AngularJS - Introducing AngularJS Controllers](http://www.jptacek.com/2013/10/introducing-angularjs-controllers/)
3. [AngularJS - Introducing NG-Repeat](http://www.jptacek.com/2013/10/angularjs-introducing-ng-repeat/)
4. [AngularJS - More with NG-Repeat](http://www.jptacek.com/2014/01/angularjs-further-with-ng-repeat/)
5. [AngularJS - Image Binding](http://www.jptacek.com/2014/01/angularjs-lou-reed/)
6. AngularJS - Introducing Templates
7. [AngularJS - Introducing Routing](http://www.jptacek.com/2014/02/angularJS-IntroToRouting/)
8. [AngularJS - Introduction to Services](http://www.jptacek.com//2014/05/angularJS-Intro-To-Services/)
9. [AngularJS - Introduction to Directives](http://www.jptacek.com/2014/06/angularJS-intro-to-directives/)
10. [AngularJS - Further with Directives](http://www.jptacek.com/2014/12/angularJS-further-with-directives/)

>Note: AngularJS does not allow for more than one ng-app directive. When I have multiple angular posts on
the home page of my blog, only one application will work. I need to refactor the entire site to account for
this. All of that to say this, you are best clicking on a single article so you can see the pages in action.

AngularJS has a lot of great features for working with HTML that allows you to split up development when you are
doing team projects. The binding approach and directives allows for a nice separation between developers and
designers. Another great piece of the platform is the ability to separate out HTML that you are using over and
over again into a template file that can then be called by multiple different pages.

In our previous example, we were consistently displaying the same repeatable line in our ``ng-repeat`` directive.
This is a great example of repeatable markup that we can extract from our page and consolidate into a single
location using a template.

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

In our controller file, we setup an object that identifies the path to our template as in the following code snippet

```javascript
$scope.template =  {name: 'template1.html', url: 'js/templates/element1.html'};
```

Within the HTML page, we then reference the template file using the ng-include directive like so

```xml
   <tr data-ng-repeat="element in periodic.elements | filter:{name:elementNameOnlyTable} | limitTo:15" data-ng-include="template.url">
```

Our page then renders the same as before, but we can now use the template in multiple places. For large teams, a most
excellent added benefit is you have removed contention issues on the file. *Note:* We are only displaying 15 results
to limit the page size.

<div id="app" ng-app="chemistryApp">
<div id="periodicTable"  ng-controller="chemTemplateCtrl1" >
    <form id="frmChem">
    <input type="text" ng-model="elementNameOnlyTable"/>
    <table class="table table-striped table-bordered table-hover table-condensed">
        <tr>
            <th>Name</th><th>Atomic Number</th><th>Weight</th><th>Phase</th><th>Ionization Energy</th><th>Melting Point</th><th>Boiling</th>
        </tr>
        <tr ng-repeat="element in periodic.elements | filter:{name:elementNameOnlyTable} | limitTo:15" ng-include="template.url">
        {{$$index}}
        </tr>
    </table>
    </form>
</div>

Since we our look and feel is controlled by templates, we can also have programmatic control over the look and feel
by dynamically setting the template. In our last post, we had committed crimes against web design by using Packer colors.

We can do something similar here by having a second template get loaded by our page. To do this, we update our
controller to have an array of templates, and choose which one we want, in this case, an ugly  Gold.

```javascript
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

<div id="periodicTable"  ng-controller="chemTemplateCtrl2" >
    <form id="frmChem">
    <input type="text" ng-model="elementNameOnlyTable"/>
    <table class="table table-striped table-bordered table-hover table-condensed">
        <tr>
            <th>Name</th><th>Atomic Number</th><th>Weight</th><th>Phase</th><th>Ionization Energy</th><th>Melting Point</th><th>Boiling</th>
        </tr>
        <tr ng-repeat="element in periodic.elements | filter:{name:elementNameOnlyTable}| limitTo:15" ng-include="template.url">
        {{$$index}}
        </tr>
    </table>
    </form>
</div>

Next, given that we have an array of template objects, we can dynamically change the look and feel on the fly using a
drop down list to select the template for display. In
the example below, we are taking our array of templates and binding to it in a select list. The value of the selected
item is then used as the template for page display, dynamically changing the UI.

```xml
<div id="periodicTable3"  data-ng-controller="chemTemplateCtrl2" >
    <form id="frmChem3">
        <select data-ng-model="templateSelect" ng-options="template.name for template in templates"></select>


        <input type="text" data-ng-model="elementNameOnlyTable"/>
        <table class="table table-striped table-bordered table-hover table-condensed">
            <tr>
                <th>Name</th><th>Atomic Number</th><th>Weight</th><th>Phase</th><th>Ionization Energy</th><th>Melting Point</th><th>Boiling</th>
            </tr>
            <tr data-ng-repeat="element in periodic.elements | filter:{name:elementNameOnlyTable} | limitTo:15" data-ng-include="templateSelect.url">

            </tr>
        </table>
    </form>
</div>
```

<div id="periodicTable3"  ng-controller="chemTemplateCtrl2" >
    <form id="frmChem3">
        <select ng-model="templateSelect" ng-options="template.name for template in templates"></select>


        <input type="text" ng-model="elementNameOnlyTable"/>
        <table class="table table-striped table-bordered table-hover table-condensed">
            <tr>
                <th>Name</th><th>Atomic Number</th><th>Weight</th><th>Phase</th><th>Ionization Energy</th><th>Melting Point</th><th>Boiling</th>
            </tr>
            <tr ng-repeat="element in periodic.elements | filter:{name:elementNameOnlyTable} | limitTo:15" ng-include="templateSelect.url">

            </tr>
        </table>
    </form>
</div>

We can also hide and show various columns based on templates. We will add a third template to our list of elements,
but this template will just show the element name, the atomic weight and the atomic number. Since our table header
rows exist outside of our template, what we want to be able to do is dynamically hide table header rows when
our subset template, element3.html, is selected. We can do this by
using a ``ng-show`` attribute on the table header elements that binds to our template name like so

```xml
<th>Name</th><th>Atomic Number</th><th>Weight</th><th data-ng-show="templateSelect.name!='template3.html'">Phase</th><th data-ng-show="templateSelect.name!='template3.html'">Ionization Energy</th><th data-ng-show="templateSelect.name!='template3.html'">Melting Point</th><th data-ng-show="templateSelect.name!='template3.html'">Boiling</th>
```

<div id="periodicTable4"  ng-controller="chemTemplateCtrl3" >
    <form id="frmChem4">
        <select ng-model="templateSelect" ng-options="template.name for template in templates"></select>


        <input type="text" ng-model="elementNameOnlyTable"/>
        <table class="table table-striped table-bordered table-hover table-condensed">
            <tr>
                <th>Name</th><th>Atomic Number</th><th>Weight</th><th ng-show="templateSelect.name!='template3.html'">Phase</th><th ng-show="templateSelect.name!='template3.html'">Ionization Energy</th><th ng-show="templateSelect.name!='template3.html'">Melting Point</th><th ng-show="templateSelect.name!='template3.html'">Boiling</th>
            </tr>
            <tr ng-repeat="element in periodic.elements | filter:{name:elementNameOnlyTable} | limitTo:15" ng-include="templateSelect.url">

            </tr>
        </table>
    </form>
</div>

Having "logic" like this, where we are setting columns based on the selected template is not the most correct way
to do this though. You rarely (and I mean rarely) want any of the logic that controls the display of the page
in the page. We can easily create a function in our controller to set if we are displaying all of the data or just
a subset based on the selected template. You can see this in the ``displayAll`` function in the final version
of our controller

```javascript
controller('chemTemplateCtrl3',
    function chemCtrl($scope) {
        $scope.periodic = perioicData;

        $scope.templates =
            [ { name: 'template1.html', url: 'js/templates/element1.html'}
                , { name: 'template2.html', url: 'js/templates/element2.html'}
                , { name: 'template3.html', url: 'js/templates/element3.html'}];
        $scope.templateSelect = $scope.templates[0];

        $scope.displayAll =  function() {
            if ($scope.templateSelect.name == $scope.templates[2].name) {
                return false;
            }
            else {
                return true;
            }
        }
    }
```

and our HTML gets updated to

```xml
<th>Name</th><th>Atomic Number</th><th>Weight</th><th data-ng-show="displayAll()">Phase</th><th data-ng-show="displayAll()">Ionization Energy</th><th data-ng-show="displayAll()">Melting Point</th><th data-ng-show="displayAll()">Boiling</th>
```


<div id="periodicTable5"  ng-controller="chemTemplateCtrl3" >
    <form id="frmChem5">
        <select ng-model="templateSelect" ng-options="template.name for template in templates"></select>


        <input type="text" ng-model="elementNameOnlyTable"/>
        <table class="table table-striped table-bordered table-hover table-condensed">
            <tr>
                <th>Name</th><th>Atomic Number</th><th>Weight</th><th ng-show="displayAll()">Phase</th><th ng-show="displayAll()">Ionization Energy</th><th ng-show="displayAll()">Melting Point</th><th ng-show="displayAll()">Boiling</th>
            </tr>
            <tr ng-repeat="element in periodic.elements | filter:{name:elementNameOnlyTable} | limitTo:15" ng-include="templateSelect.url">
            </tr>
        </table>
    </form>
</div>

</div><!-- ng-app -->

As you can see, templates in AngularJS offer a lot of functionality. They allow for splitting up of
work across large development teams. You can also dynamically update the look and feel based on the
template the user selects. This is all happening client side too, reducing round trips to the server. Good
stuff!

You can either visit [http://angularperiodic.azurewebsites.net/](http://angularperiodic.azurewebsites.net/) to see the code in action and
as always find the code out on [GitHub](https://github.com/jptacek/AngularPeriodic)



<script type="text/javascript" src="/2014/02/angularJS-templates/js/chemistryApp.js"></script>
<script type="text/javascript" src="/2014/02/angularJS-templates/js/chemistryController.js"></script>
<script type="text/javascript" src="/2014/02/angularJS-templates/js/chemistry.js"></script>