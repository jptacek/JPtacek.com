---
layout: post
title: National Pi Day - Calculating PI With AngularJS and a Monte Carlo Simulation
date: 2014-03-14
tags: ["AngularJS","Pi","Web","Ephemera","Skyline Technologies"]
---

Every year on 3/14, Geeks everywhere can let their geek flag fly by
celebrating [National Pi Day](http://en.wikipedia.org/wiki/Pi_Day). On this day, every year, the date equals the first three
digits of π, 3.14. Last year we celebrated with a [blog post](http://www.jptacek.com/2013/03/have_your_pi/), so let’s do it again!

In last year’s post, we calculated Pi using Leibiniz formula to determine π, which is a relatively slow algorithm.

This year we are going to look at a totally different approach, a Monte Carlo simulation.
A [Monte Carlo simulation](http://en.wikipedia.org/wiki/Monte_Carlo_method) is a statistical approach where you use
random numbers to run a simulation over and over and record those results. It is very popular in the fields of finance,
fluid mechanics and the study of Brownian Motion. For our scenario today, you can also use a Monte Carlo method to calculate π!

To do this, we are going to use two geometric formulas, one to calculate the area of a square and the second the area of a
circle. If we put a circle of radius R in a square of length 2R, we have a scenario as shown in Figure 1.

![Circle in Square](PtacekPie_002.GIF)

The area of the rectangle will then be 4R<sup>2&nbsp;</sup>  and the area of the circle will be πR<sup>2&nbsp;</sup>.
Dividing the area of the circle by the area of the rectangle give us π /4. Stated another way, the ratio of area of the
circle to that of the square is Pi/4.

The Monte Carlo method comes into play because we will randomly put a point on the square. If the point falls within
the circle, we record it. The total ratio of points in the circle (aka, the area of the circle) to total points
(aka, the area of the square) will tell us π /4.

So, we now know a way to calculate π, the next step is to actually write some code. There are, obviously, many
ways we could go and do this, but lately I have been kicking the tires with AngularJS and thought this would work as
well as anything.

We won’t spend a lot of time jumping into AngularJS. You can check out some previous posts at
[http://www.jptacek.com/tags/angularjs/](http://www.jptacek.com/tags/angularjs/) for an introduction.

We will have two things, our chemistryApp.js file to create our angular application, piApp, and our controller,
 where the interesting stuff will happen.

Our HTML file is pretty basic,

```xml
<div id="piApp" ng-app="piApp">
    <div id="piCtrl" ng-controller="piAppController">
        <input id="iteration" data-ng-model="iterations"/><br/>
        <div id="piCalc" >{{pi}}</div><br/>
        <div id="piCalcDiff" >{{delta}}</div><br/>
        <button data-ng-click="calculatePi()" >Update</button>
    </div>
</div>
```

We will enter in the number of random dots (iterations) we want our simulation to run. The more dots, the closer we get.
We will then display the calculated value of π and how close we are to π actual. Last, we have a button that we will click to
execute our Monte Carlo simulation.

Our AngularJS controller is where the interesting stuff is happening, and that is not even particularly interesting.

We have created a function, determinePi, which will perform our calculation. We assume a circle with a radius of 1.
We then generate two random numbers, one for the x position and one for the y position. We know that
(x<sup>2&nbsp;</sup> + y<sup>2&nbsp;</sup>)=1 (the radius of our circle), so for any value that is less than this, we know we are
inside the circle and increment a counter for hits inside. Once we are done with the iterations, we determine our
calculated version of π and the difference from our known value of π for display on the page. In our calculation, we are only
really doing a quadrant, just to make the code a bit easier to follow. It all works though since we are just talking about
ratios.

This is not a super accurate, or super-fast method of calculating π, but it was an interesting chance to take a quick look at
Monte Carlo methods, which are common place with a subset of our clients.

<div id="piApp" ng-app="piApp">
    <div id="piCtrl" ng-controller="piAppController">
        <input id="iteration" -ng-model="iterations"/><br/>
        <div id="piCalc" >{{pi}}</div><br/>
        <div id="piCalcDiff" >{{delta}}</div><br/>
        <button ng-click="calculatePi()" >Update</button>
    </div>

</div>

Happy Pi day! Go have a nice piece of Apple Pie and enjoy the day!!

This post originally appeared at [Skyline Technologies](http://skylinetechnologies.com/Blog/Article/2453/National-Pi-Day-Calculating-Pi-with-AngularJS-and-a-Monte-Carlo-simulation.aspx)
<script type="text/javascript" src="/2014/03/National-Pi-Day-2014/js/piApp.js"></script>
<script type="text/javascript" src="/2014/03/National-Pi-Day-2014/js/piController.js"></script>
