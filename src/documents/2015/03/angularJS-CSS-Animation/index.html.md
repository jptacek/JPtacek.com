---
layout: post
title: AngularJS - CSS Animations
date: 2015/03/04
tags: ["AngularJS","JavaScript","Web"]
---

[AngularJS](http://www.angularjs.org) is a Javascript MVC framework from the fine folks over at
[Google](http://www.google.com). The focus of Angular is building complex
 HTML based client applications. Its design philosophy is data first, where your data will be updating the DOM.
 Contrast this to a framework like JQuery where the DOM will update your data.

![AngularJS Logo](angularLogo.png)

This is the twelfth in a series of posts on AngularJS where we are using Chemistry data from the periodic table
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
11. [AngularJS - Best Practices](http://jptacek.com/2015/02/angularJS-Best-Practices/)
12. AngularJS - CSS Animations

>Note: AngularJS does not allow for more than one ng-app directive. When I have multiple angular posts on
the home page of my blog, only one application will work. I need to refactor the entire site to account for
this. All of that to say this, you are best clicking on a single article so you can see the pages in action.

AngularJS enables animations via the NgAnimate directive. This is an external JavaScript file that you will need for
your application, so you will need to obtain the JavaScript. This can be done via the usual suspects, CDN,
[download](https://code.angularjs.org/) or Bower. The Bower install command is ``bower install angular-animate``

There are three ways to do animations in AngularJS:
* CSS Animations
* CSS Transitions
* Javascript

We will look at each of these in separate posts, but will get started with CSS Animations.



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

<br/>
I have created an Azure Website to host all of this code at [http://angularperiodic.azurewebsites.net/](http://angularperiodic.azurewebsites.net/)

The code is also available on [GitHub](https://github.com/jptacek/AngularPeriodic)

<link href="/2015/03/angularJS-CSS-Animation/css/animate.css" rel="stylesheet" >

<script type="text/javascript" src="/2015/03/angularJS-CSS-Animation/js/chemistryApp.js"></script>
<script type="text/javascript" src="/2015/03/angularJS-CSS-Animation/js/chemistryController.js"></script>
<script type="text/javascript" src="/2015/03/angularJS-CSS-Animation/js/chemistryService.js"></script>
<script type="text/javascript" src="/2015/03/angularJS-CSS-Animation/js/chemistryDirective.js"></script>


