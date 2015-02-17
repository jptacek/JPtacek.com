---
layout: post
title: AngularJS - Best Practices
date: 2015/02/10
tags: ["AngularJS","JavaScript","Web"]
---

[AngularJS](http://www.angularjs.org) is a Javascript MVC framework from the fine folks over at
[Google](http://www.google.com). The focus of Angular is building complex
 HTML based client applications. Its design philosophy is data first, where your data will be updating the DOM.
 Contrast this to a framework like JQuery where the DOM will update your data.

![AngularJS Logo](angularLogo.png)

This is the eleventh in a series of posts on AngularJS where we are using Chemistry data from the periodic table
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
10. [AngularJS - Further with Directives](http://jptacek.com/2014/12/angularJS-further-with-directives/)
11. AngularJS - Best Practices

>Note: AngularJS does not allow for more than one ng-app directive. When I have multiple angular posts on
the home page of my blog, only one application will work. I need to refactor the entire site to account for
this. All of that to say this, you are best clicking on a single article so you can see the pages in action.

This blog series on AngularJS has been going on for a while, since October 2013 to be exact. In that time, AngularJS
has changed and best practices have emerged. I thought it would be worth taking a look at the current state of best
practices and refactoring some of the code we have been working on to reflect that.

To start off, there are people a lot smarter than me thinking about this stuff. Some of these folks work at Google and
they have published a style guide you can find at the
[Google Code site](http://google-styleguide.googlecode.com/svn/trunk/angularjs-google-style.html).
The Google Style Guide is a good start, but it it not as complete as some I have run across. It also is heavily focused
on [Closure](https://developers.google.com/closure/), a Google toolset that not everybody is invested in.

A second great resource is [Todd Motto's](http://toddmotto.com/) AngularJS Style Guide. Todd has a
[blog post](http://toddmotto.com/opinionated-angular-js-styleguide-for-teams/) where he introduces his reasoning for some
of his choices. Cooler yet, he has a [GitHub repository](https://github.com/toddmotto/angularjs-styleguide)
 that he keeps up to date with the latest set of changes and reasoning.

A third resource is from [John Papa](http://www.johnpapa.net/), one time Microsoft evangelist and Google Developer
Expert. Like Todd, John has a GitHub repo with his [Style Guide](https://github.com/johnpapa/angularjs-styleguide).

The great thing about what both Todd and John have done by putting their Style Guides on GitHub is that it makes it
easy to make one of them YOUR Style Guide. Clone the repo and publish within your organization. It is a great way to get
started to introduce consistency.

I have decided to follow the example setup by John Papa. I find his
[Pluralsight courses](http://www.pluralsight.com/author/john-papa) to be
great resources for developers and you have to start some place.


###IIFE###
The first thing we are going to do to our code is to rework our code to implement IIFEs. IIFEs stand for Immediately-Invoked
Function Expressions, pronounced 'iify'. This is a standard JavaScript best practice to isolate scope of functions.
JavaScript has a single execution scope, as you  load more and more libraries and variables, you run into the "opportunity"
for name collisions. This makes for a very painful day of code debugging.

IIFEs then are a common pattern to use to avoid polluting the namespace. It works to keep all of the variables
localized to the scope of the function being executed. We also end up being able to optimize minification, since our
variables are localized.

The general syntax of an IIFE is

```javascript
(function() {
   /* code */
})();
```

The function executes immediately, thanks to the parens at the end of the function call.

We have been bad programmers in this code examples, so we will clean this up and be better moving forward. This
ends with us reworking our JavaScript code. Here is a before/after example for our app.js file.

Before:
```javascript
'use strict';

var chemistryApp = angular.module('chemistryApp', []);

```

After:

```javascript
(function() {
    'use strict';

 var chemistryApp = angular.module('chemistryApp', []);
})();
```

Ben Alman is credited with nameing IIFEs in this [blog post](http://benalman.com/news/2010/11/immediately-invoked-function-expression/)
if you want more information

<div id="app" ng-app="chemistryApp">
    <div class="container" ng-controller="chemistryController">

      <div class="row">
          <select ng-model="periodicElement" ng-options="e.name for e in elements"></select><br/>
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


<link href="/2015/02//angularJS-Best-Practices/css/animate.css" rel="stylesheet" >

<script type="text/javascript" src="/2015/02/angularJS-Best-Practices/js/chemistryApp.js"></script>
<script type="text/javascript" src="/2015/02/angularJS-Best-Practices/js/chemistryController.js"></script>
<script type="text/javascript" src="/2015/02/angularJS-Best-Practices/js/chemistryService.js"></script>
<script type="text/javascript" src="/2015/02/angularJS-Best-Practices/js/chemistryDirective.js"></script>


