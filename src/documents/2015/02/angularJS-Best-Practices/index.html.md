---
layout: post
title: AngularJS - Best Practices
date: 2015/02/18
tags: ["AngularJS","JavaScript","Web"]
scripts: ['/2015/02/angularJS-Best-Practices/js/chemistryApp.js','/2015/02/angularJS-Best-Practices/js/chemistryController.js','/2015/02/angularJS-Best-Practices/js/chemistryService.js','/2015/02/angularJS-Best-Practices/js/chemistryDirective.js']



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
12. [AngularJS - CSS Animations](http://jptacek.com/2015/03/angularJS-CSS-Animation/)

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
 that he keeps up to date with his latest set of changes and reasoning behind them.

A third resource is from [John Papa](http://www.johnpapa.net/), one time Microsoft evangelist and Google Developer
Expert. Like Todd, John has a GitHub repo with his [Style Guide](https://github.com/johnpapa/angularjs-styleguide).

The great thing about what both Todd and John have done by putting their Style Guides on GitHub is that it makes it
easy to make one of them YOUR Style Guide. Clone the repo and publish within your organization. It is a great way to get
started and introduce consistency within your organization.

I have decided to gnerally follow the style guide setup by John Papa. I find his
[Pluralsight courses](http://www.pluralsight.com/author/john-papa) to be
great resources for developers and you have to start some place.


###IIFE###
The first thing we are going to do to our code is to rework how our code to implement IIFEs. IIFEs stand for Immediately-Invoked
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

We have been bad programmers in our code examples, so we will clean this up and be better moving forward. This
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

###Getter/Setter###
The next step we want to take to improve our code is how we are creating and referencing our module. Initially we were
using code based on AngularJS.com samples, where we declare a module as a variable, for example:

```javascript
 var chemistryApp = angular.module('chemistryApp', []);
```

The recommendation, straight from the [Angular site](https://docs.angularjs.org/guide/module) is to use the getter
syntax at all times. The syntax above, will create the module each time, overwriting the existing one.

Getter syntax for the module enables us to retrieve an existing module. We rework our ``app.js`` to now incorporate
both IIFE and setter syntax to become

```javascript
(function() {
    'use strict';

    angular
    .module('chemistryApp',[]);
})();
```
###Named Functions###
Next, we are going to rework our code to utilize named functions, mostly for code readability as it reduces the amount
of callback functions in our code.

For our Controller definition we could define our function with a callback as

```javascript
(function() {
    'use strict';

    angular
        .module('chemistryApp')
        .controller('chemistryController', ['$scope', 'chemistryService', '$log',
            function chemistryController($scope, chemistryService, $log) {


        // some code
      }]
    )
})();

```

However, the nesting can make long term code maintenance and readability more cumbersome. A better approach is

```javascript
(function() {
    'use strict';

    angular
        .module('chemistryApp')
        .controller('chemistryController',chemistryController);

      function chemistryController($scope,  chemistryService,$log) {

        // some code


    }

})();
```

###Dependency Injection###
AngularJS has a great Dependency Injection (DI) framework. The way we have the code working above can cause some issues
with things like bundling and minification. When minification tools rename our DI functions, they may not be found
by Angular. As a result, you should explicitly identify DI functions to avoid this.

One way to do is to rework function calls such as

```javascript
function() {
    'use strict';

    angular
        .module('chemistryApp')
        .controller('chemistryController',chemistryController);

      function chemistryController($scope,  chemistryService,$log) {

        // some code


    }

})();
```

to identify what is being injected. You need to be sure to map up parameters properly, or all kinds of madness will
ensue

```javascript
(function() {
     'use strict';

     angular
         .module('chemistryApp')
         .controller('chemistryController',
         ['$scope', 'chemistryService','$log',chemistryController]);

       function chemistryController($scope,  chemistryService,$log) {

         // some code


     }

 })();
```

Another, better and recommended approach, is to use the ``$inject`` function to explicitly identify what is being
injected.

```javascript
(function() {
    'use strict';

    angular
        .module('chemistryApp')
        .controller('chemistryController',chemistryController);

    chemistryController.$inject =  ['$scope', 'chemistryService','$log'];

    function chemistryController($scope,  chemistryService,$log) {

         // some code


    }

})();
```
The reasons for this approach are the same as above, bypassing minfication issues. This approach though is more
explicit and makes the code more readable.

###Explicit function declarations###
Another good practice is to explicitly identify function definitions. If we look at our original service function
the structure was

```javascript
chemistryApp.service('chemistryService', function () {

    var getCssClassElement = function ( elementType) {
        // code
    };

    var getElements = function() {

        // code

        return periodicData.elements;


    };

    return {
        getCssClassElement : getCssClassElement,
        getElements: getElements
    };
});

```

which is kind of what we want. One of the places where Papa and Motto differ on their approaches though is WHERE
the function declarations should happen. Papa prefers that start of the service and Motto towards the bottom. I lean
towards the Papa approach because I can explicitly see my "public interfaces" for the function. This is ultimately
what we want to be testable in our code. However, the downside is some scrolling to get to the implementation details.
Ultimately, make a choice and be consistent.

```javascript
(function() {
    'use strict';

    angular
        .module('chemistryApp')
        .service('chemistryService',chemistryService);

    function  chemistryService() {
        return {
            getCssClassElement: getCssClassElement,
            getElements: getElements
        };

        function getCssClassElement(elementType) {
            // some code
        };

        function getElements() {

            // some code

        };
    }
})();

```

###Directory Structure###
Next up is best practices for directory structure. Ultimately, we are not going to refactor this code to reflect this best
practice. However, in the real world, where I do this for a living, I definitely follow the practice outlined below.
What we have here is too small.

Initially, when you start creating an Angular app, most people start by organizing my folders by the type of code they are writing.
This results in a folder for controllers, one for services, directives, etc. This can work at the beginning, but by the
the time you are working on a large app, it becomes difficult. Having 15 controller functions in a directory, then
searching for the corresponding service functions in another directory is NOT efficient.

Instead, the recommendation is to organize folders by function. For example, if you have a sports application you
would have a baseball folder with controller, service and directive files in that directory applicable to baseball.
All the functionality is
concisely gathered in a single folder location. Much easier.

###Wrapping Up###
I have reworked the code for the app we have been talking about to reflect the best practices outlined above. The
functionality is the same as last time, but ultimately, a bit more maintainable long term and less likely to run
into issues with minification and bundling. The app doesn't look a whole lot different though, which is a good thing.

Ultimately, the goals of what we are doing is to make the code more explicit, more readable and ultimately more
maintainable. Both Papa and Motto have great approaches and styles. Pick what works for you and be cosistent within
your projects and teams.




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


I have created an Azure Website to host all of this code at [http://angularperiodic.azurewebsites.net/](http://angularperiodic.azurewebsites.net/)

The code is also available on [GitHub](https://github.com/jptacek/AngularPeriodic)
</div>


<link href="/2015/02/angularJS-Best-Practices/css/animate.css" rel="stylesheet" >
