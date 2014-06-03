---
layout: post
title: Calculating the Cost of the 12 Days of Christmas
date: 2013-12-12
tags: ["AngularJS", "JavaScript", "Skyline Technologies", "Web"]
---
<script src='/2013/12/calculating-the-cost-of-the-12-days-of-christmas/scripts/12DaysApp.js'></script>
<script src='/2013/12/calculating-the-cost-of-the-12-days-of-christmas/scripts/christmasController.js'></script>

Every year in December, families gather around the table to celebrate Christmas. If your house is anything like my house, the good times, food and conversation can quickly escalate into a battle over what is the true cost of the classic Christmas Song, the 12 Days of Christmas! This year, I took matters into my own hand and wrote a calculator, that will calculate the cost of the 12 days of Christmas using Google's Javascript Framework, AngularJS. No more bickering at the family table over the holidays!

AngularJS is a Javascript framework from Google that focuses on building complex data applications. It has a very strong data first philosophy, which is a little different than jQuery which focuses more on DOM manipulation. You can find out more about AngularJS at the [official site](http://angularjs.org/), or read some recent blog posts I have written up at [http://www.jptacek.com/tags/angularjs/](http://www.jptacek.com/tags/angularjs/).

AngularJS is a Model View Controller (MVC) framework. The model represents our data, or an object. In our case, the model will be the cost of the items in the twelve days of Christmas; e.g., a partridge, a pear tree, a turtle dove, etc. The view is our HTML page which is responsible for displaying data. The controller is responsible for marshalling the data to the view, and helping control its state. To enable our 12 Days calculator, we will take advantage of these AngularJS features.

First, we essentially wire up our page to indicate we are going to have an Angular app by putting a <span style="font-family:Courier New">ng-app</span> attribute in the HTML body tag. Next, we set an area of our HTML markup that our controller is responsible for with a <span style="font-family:Courier New">ng-controller</span> attribute in a DIV tag.

``` xml
<body ng-app="christmasApp">
<b>12 Days of Christmas Calculator</b>
<div class="container" id="12Days" ng-controller="christmasController">
...
</div>
```

It is worth nothing that use of data-* attributes is more "semantically" correct. If you want to save yourself keystrokes, you can just use <span style="font-family:Courier New">ng-app</span> or <span style="font-family:Courier New">ng-controller</span>, but if you get bothered by having warnings in your code, like me, you will want to use <span style="font-family:Courier New">ng-app</span>, etc.

Of course, this being Javascript and all, we need references to JavaScript files that contain this logic for implementation. Usually in structuring a project there will be an chemistryApp.js file that sets up your Angular application, controllers for interacting between your model and the view as well as services.

Our chemistryApp.js file, which we call 12DaysApp.js, is just two lines and creates the scope we reference in our body markup, christmasApp.


_12DaysApp.js
_

``` javascript
'use strict';
var christmasApp = angular.module('christmasApp', []);
```

Our next Javascript file is the controller and this is where the interesting stuff is. Essentially, AngularJS has the concept of a <span style="font-family:Courier New">$scope</span>. This is essentially a glorified property bad or state manage for interacting with the page. Within our controller, we create variables on the scope for each of our items. We are grabbing costs from a USA Today story from last year ([http://www.usatoday.com/story/money/business/2012/11/26/12-days-of-christmas-107k/1726807/](http://www.usatoday.com/story/money/business/2012/11/26/12-days-of-christmas-107k/1726807/)).

To setup our controller, we create a controller with a callback such as

_christmasController.js

``` javascript
christmasApp.controller('christmasController',
    function christmasController($scope) {

);
```
<p>Notice passing in the $scope variable on the parameter list. AngularJS does a VERY nice job with Dependency Injection. By passing in the $scope variable we are enabling its use within our controller and the HTML view. As you explore Angular, you will come to appreciate how quickly you can add services or logging, etc. with their Dependency Injection framework.

We can then create a variable on the scope to set the cost for items we are getting for the 12 days of Christmas. For example, to set the price of a pear tree to $189.99 and a partridge, we have the following lines in our controller

``` javascript
$scope.pearTree = 189.99;
$scope.partridge = 15.00;
```

We then create a JavaScript function to calculate the cost of the first day.

``` javascript
  $scope.day1 =  function () {
  return parseFloat($scope.pearTree) +  parseFloat($scope.partridge);
 };
```

Now, the magic of two way data binding can start, by including the AngularJS library, our application JavaScript file and our Controller JavaScript file, get two way databinding. In our HTML markup, curly braces ( <span style="font-family:Courier New">{{ }}</span> ) indicate our AngularJS model.

So for the following markup, the <span style="font-family:Courier New">ng-model="partridge"</span> on our Input element says that we are two way binding the <span style="font-family:Courier New">$scope.partidge</span> value in our UI. And since this binding is part of a HTML Input box, whenever we make changes, it will update our UI. For example, we are displaying the Day 1 whatever value we initially set will be displayed. We then automatically update the value of function day1 via the function. This function is automatically updated and our UI as well whenever we type in a new value. This is pretty magical for developers who used to capture JavaScript key up and down events!

<p>&nbsp;</p>

<div id='appContainer' ng-app="christmasApp">
<div id="12Days" ng-controller="christmasController">
    <h3>12 Days of Christmas</h3>
 <div class="row">
        <div class="col-sm-6">Partridge: <input id="partridgeEle" ng-model="partridge" type="text">  </div>
        <div class="col-sm-4">Day 1: {{day1()| currency:"$"}}</div>
 </div>
 <div class="row">
        <div class="col-sm-6">Pear Tree: <input id="pearTreeEle" ng-model="pearTree" type="text"> </div>
        <div class="col-sm-4">&nbsp;</div>
 </div>
     <div class="row">
        <div class="col-sm-6">Two Turtle Doves: <input id="turtleEle" ng-model="turtleDove" type="text"> </div>
        <div class="col-sm-4">Day 2: {{day2()| currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="col-sm-6">Three French Hens: <input id="frenchHenEle" ng-model="frenchHen" type="text"> </div>
        <div class="col-sm-4">Day 3: {{day3()| currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="col-sm-6">Four Colly Birds: <input id="callingBirdElee" ng-model="callingBird" type="text"> </div>
        <div class="col-sm-4">Day 4: {{day4()| currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="col-sm-6">Five Gold Rings: <input id="goldRingEle" ng-model="goldRing" type="text"> </div>
        <div class="col-sm-4">Day 5: {{day5()| currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="col-sm-6">Six Geese a-laying: <input id="geeseEle" ng-model="geese" type="text"> </div>
        <div class="col-sm-4">Day 6: {{day6()| currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="col-sm-6">Seven Swans a swimming: <input id="swansEle" ng-model="swan" type="text"> </div>
        <div class="col-sm-4">Day 7: {{day7()| currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="col-sm-6">Eight Maids a Milking: <input id="milkingMaidElee" ng-model="milkingMaid" type="text"> </div>
        <div class="col-sm-4">Day 8: {{day8()| currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="col-sm-6">Nine Ladies Dancing: <input id="ladiesEle" ng-model="dancingLady" type="text"> </div>
        <div class="col-sm-4">Day 9: {{day9()| currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="col-sm-6">10 Lords-a-Leaping: <input id="lordsEle" ng-model="lord" type="text"> </div>
        <div class="col-sm-4">Day 10: {{day10()| currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="col-sm-6">Eleven Pipers piping: <input id="pipersEle" ng-model="piper" type="text"> </div>
        <div class="col-sm-4">Day 11: {{day11()| currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="col-sm-6">Twelve Drummers Drumming: <input id="drummersEle" ng-model="drummer" type="text"> </div>
        <div class="col-sm-4">Day 12: {{day12()| currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="col-sm-6"><strong>Total Cost of the twelve days:</strong></div>
        <div class="col-sm-4">{{totalCostChristmas()| currency:"$"}}</div>
    </div>
    </div>
</div>

<p>&nbsp;</p>

**christmasController.js Code**
``` javascript
'use strict';

christmasApp.controller('christmasController',
    function christmasController($scope) {
        // http://www.irishmirror.ie/female/family/how-much-would-cost-presents-2851366
        // http://www.usatoday.com/story/money/business/2012/11/26/12-days-of-christmas-107k/1726807/
        //one
        $scope.pearTree = 189.99;
        $scope.partridge = 15.00;

        //two
        $scope.turtleDove = 62.50;

        // three
        $scope.frenchHen = 55;

        // four
        $scope.callingBird = 129.24;

        // five
        $scope.goldRing = 150;
        // six
        $scope.geese = 35;

        // seven swans
        $scope.swan = 1000.0;

        // eight
        $scope.milkingMaid = 7.25;

        // nine ladies dancing
        $scope.dancingLady = 700.0;

        // ten lords
        $scope.lord = 476.7;

        // eleven pipers at 232.91/hour
        $scope.piper = 232.91;

        // twelve drummers drumming
        $scope.drummer = 231.33;

        $scope.day1 =  function () {
            return parseFloat($scope.pearTree) +  parseFloat($scope.partridge);

        };

        $scope.day2 = function () {
            return parseFloat($scope.turtleDove) * 2;
        };

        $scope.day3 = function () {
            return parseFloat($scope.frenchHen) * 3;
        };

        $scope.day4 = function () {
            return parseFloat($scope.callingBird) * 4;
        };

        $scope.day5 = function () {
            return parseFloat($scope.goldRing) * 5;
        };

        $scope.day6 = function () {
            return parseFloat($scope.geese) * 6;
        };

        $scope.day7 = function () {
            return parseFloat($scope.swan) * 7;
        };

        $scope.day8 = function () {
            return parseFloat($scope.milkingMaid) * 8;
        };

        $scope.day9 = function () {
            return parseFloat($scope.dancingLady) * 9;
        };

        $scope.day10 = function () {
            return parseFloat($scope.lord) * 10;
        };

        $scope.day11 = function () {
            return parseFloat($scope.piper) * 11;
        };

        $scope.day12 = function () {
            return parseFloat($scope.drummer) * 12;
        };

        $scope.totalCostChristmas = function() {
            return  12* $scope.day1() + 11* $scope.day2() + 10*  $scope.day3() +  9 * $scope.day4()+ 8 * $scope.day5()+ 7* $scope.day6() +
                6 * $scope.day7() +  5* $scope.day8() +  4* $scope.day9() + 3* $scope.day10() +  2* $scope.day11() +  $scope.day12();
        };

    }
);
```

**HTML Code**
```xml
<!DOCTYPE html>
<html>
<head>
    <title>12 Days of Christmas</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script src="angular.min.js"></script>
    <script src="12DaysApp.js"></script>
    <script src="christmasController.js"></script>
</head>
<body ng-app="christmasApp">
<b>12 Days of Christmas Calculator</b>
<div class="container" id="12Days" ng-controller="christmasController">
    <h2>12 Days of Christmas</h2>
    <div class="row">
        <div class="span6">Partridge: <input id="partridgeEle" ng-model="partridge" type="text"> Pear Tree: <input id="pearTreeEle" ng-model="pearTree" type="text"> </div>
        <div class="span2">Day 1: {{day1()' currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="span8">Two Turtle Doves: <input id="turtleEle" ng-model="turtleDove" type="text"> </div>
        <div class="span4">Day 2: {{day2()' currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="span8">Three French Hens: <input id="frenchHenEle" ng-model="frenchHen" type="text"> </div>
        <div class="span4">Day 3: {{day3()' currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="span8">Four Colly Birds: <input id="callingBirdElee" ng-model="callingBird" type="text"> </div>
        <div class="span4">Day 4: {{day4()' currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="span8">Five Gold Rings: <input id="goldRingEle" ng-model="goldRing" type="text"> </div>
        <div class="span4">Day 5: {{day5()' currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="span8">Six Geese a-laying: <input id="geeseEle" ng-model="geese" type="text"> </div>
        <div class="span4">Day 6: {{day6()' currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="span8">Seven Swans a swimming: <input id="swansEle" ng-model="swan" type="text"> </div>
        <div class="span4">Day 7: {{day7()' currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="span8">Eight Maids a Milking: <input id="milkingMaidElee" ng-model="milkingMaid" type="text"> </div>
        <div class="span4">Day 8: {{day8()' currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="span8">Nine Ladies Dancing: <input id="ladiesEle" ng-model="dancingLady" type="text"> </div>
        <div class="span4">Day 9: {{day9()' currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="span8">10 Lords-a-Leaping: <input id="lordsEle" ng-model="lord" type="text"> </div>
        <div class="span4">Day 10: {{day10()' currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="span8">Eleven Pipers piping: <input id="pipersEle" ng-model="piper" type="text"> </div>
        <div class="span4">Day 11: {{day11()' currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="span8">Twelve Drummers Drumming: <input id="drummersEle" ng-model="drummer" type="text"> </div>
        <div class="span4">Day 12: {{day12()' currency:"$"}}</div>
    </div>
    <div class="row">
        <div class="span8">Total Cost of the twelve days:</div>
        <div class="span4">{{totalCostChristmas()' currency:"$"}}</div>
    </div>

</div>
</body>
</html>
```
This blog post originally appeared at [Skyline Technologies](http://skylinetechnologies.com/Blog/Article/2403/Day-Two-How-Much-Do-The-Twelve-Days-of-Christmas-Cost.aspx)
