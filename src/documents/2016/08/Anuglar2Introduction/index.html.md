---
layout: post
title: Angular/Angular2 Introduction
date: 2016/08/12
tags:  ["Angular","Web","Angular2","JavaScript"]
---

I spent a lot of time blogging about [AngularJS](https://jptacek.com/tags/angularjs/) in the past. Time moves on, especially on the Internet and 
[Google](https://www.google.com) is feverishly working on finishing up [Angular2](https://angular.io), which is currently in release candidate as of 
this writing (August of 2016).
<img src="angularLogo.svg?raw=true" width="25%"></img>

We will take a similar approach to last time, where we developed a periodic table application that investigates different features about 
Angular.

One thing to note, Google has renamed Angular 2. The previous version of AngularJS, the 1.x stack was called AngularJS. The new
version is now called just Angular. Part of the reason for this is to show its ability to create native mobile applications, so 
the JavaScript name can be a bit limiting. We will, in general, keep the same names. Angular and/or Angular 2 will refer to the current 
version of Anuglar. The older versions will be called AngularJS or Angular 1.x.

First though, why even upgrade at all, since the upgrade path from Angular 1.x to Angular 2? Let's highlight some reasons.

### Component Based
Web development is moving towards component based development, especially with some of the emerging
[web standards](https://www.w3.org/TR/NOTE-HTMLComponents). While those standards are not fully completed yet, Google is definitley
preparing for that world. If you need further proof, checkout Google's [Polymer](https://www.polymer-project.org/1.0/) project.

### TypeScript
TypeScript is an extension of JavaScript created by Microsoft, open sourced and adopted by Google (I know!! Right?!?!)
TypeScript essentially is ECMAScript 6, combined with the ability to create type and annotations. It is used to create 
Angular. The code samples developed by Google are all in TypeScript, with JavaScipt following later. You don't HAVE to use 
TypeScript, but it will make life easier.

### Virtual DOM
One of the things [ReactJS](https://facebook.github.io/react/) taught the world, is the value of a Virtual DOM. This is a virtual representation
of the Document Object Model (DOM) for a HTML page. You can then work on this in memory which offers GREAT performance improvements. 
Google has adopted a Virtual DOM and has realized the expected performance boosts.

Those are a few of the highlights of why Angular2 over AngularJS 1.x. We will hit more as we contineu our series.


