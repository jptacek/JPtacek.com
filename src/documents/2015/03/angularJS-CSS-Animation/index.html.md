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
* CSS Transitions (or Keyframe Animations)
* Javascript

We will look at each of these in separate posts, but will get started with CSS Animations.

It is important to realize that the animations we are talking about in AngularJS here are not going to allow you to
create a Pixar movie. The animations are really, much more subtle, and provide a bit of visual flair to your application.

In this post, we are going to focus on three AngularJS events that we can use with CSS animations. It is important to
realize that Angular does not do any of the animations, but provides hooks for us to use our own animations, be they
via CSS or JavaScript.

There are five AngularJS events
* enter - DOM element is add to the DOM tree
* leave - DOM element is removed from the DOM tree
* move - DOM element is moved within the DOM tree
* addClass - A class is added to an element
* removeClass - A class is removed from an element

So we have events get fired, the next thing that happens is the naming conventions for our CSS classes start getting
 applied. Angular usings the naming convention `[class]-[event]-[state]`. So, for the enter event, we have a `.ng-enter'
 class and a `.ng-enter-active` class.

The above is a little confusing, so let's try to state it another way. The AngularJS animate library supports animations
for enter, leave and move. If we create a list in Angular and then have a filter applied, ngAnimate then toggles the
CSS classes for us based on the state. Within these classes we then define our CSS for animation.

What does this look like? Well first, we need to inject the animation framework into our application. You can get
ngAnimate from the [code.angularjs.org](https://code.angularjs.org/) site or via bower
```bower install angular-animate@X.Y.Z```.

After installation and including the js library in your application
(```<script type="text/javascript" src="angular-animate.min.js"></script>```) you need to inject into your app module.

``javascript
(function() {
    'use strict';

    angular
        .module('chemistryApp', [
            'ngAnimate'
        ]);
})();
``

also CSS

``css
.periodicCell-animation.ng-enter, .periodicCell-animation.ng-leave {
    -webkit-transition: 0.5s linear all;
    -moz-transition: 0.5s linear all;
    -o-transition: 0.5s linear all;
    transition: 0.5s linear all;
}

.periodicCell-animation.ng-enter {
    opacity: 0;
}


.periodicCell-animation.ng-enter-active {
    opacity: 0;
}


.periodicCell-animation.ng-leave {
    opacity: 1;
}


.periodicCell-animation.ng-leave.ng-leave-active {
    opacity: 0;
}
``



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


