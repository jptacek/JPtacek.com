---
layout: post
title: AngularJS - Lou Reed
date: 2014-01-24
tags: ["AngularJS","JavaScript","Web"]
---

[AngularJS](http://www.angularjs.org) is a Javascript MVC framework from the fine folks over at
[Google](http://www.google.com). The focus of Angular is building complex
 HTML based client applications. Its design philosophy is data first, where your data will be updating the DOM.
 Contrast this to a framework like JQuery where the DOM will update your data.

![AngularJS Logo](angularLogo.png)

I am a pretty huge [Lou Reed](http://en.wikipedia.org/wiki/Lou_Reed) fan. It is quite probable I spent WAY too
much time listening to Lou Reed and Velvet Underground music when I was a teenager. So, having said that, soon
after Lou Reed died, I was doing a [presentation](/2013/11/fvnug-presentation-nov-2013/) at the
[NorthEast Wisconsin Developer UserGroup](http://newdug.org/) (aka, NEWDUG and
yes it is a lot to type) and I thought it would be fun to have a little Lou Reed shout out. Since the talk
was about AngularJS, it of course had an Angular flavor. Most important and of interest to you dear reader, is
how I found out a way to deal with missing images!

![Lou Reed](Lou_Reed.jpg)

Instead of using chemistry data, we used Lou data. This data was a JSON object of record releases. One of the
objects looks like

```javascript
 {
            "album": "Lou Reed",
            "artist": "Lou Reed",
            "releaseDate": 6/1/1972,
            "image": "http://upload.wikimedia.org/wikipedia/en/8/88/Lour72.jpg",
            "label": "RCA"
        }
```

Essentially what we are doing is the same stuff that came before, instantiating the app and referencing our
controller and looping through the albums and making a little table. This is quickly becoming old hat
for us!

<h3>Lou Reed pages</h3>

<div id='appContainer' ng-app="louApp">
 <div id="louTable0"  ng-controller="louCtrl" >
    <table class="table table-striped table-bordered table-hover table-condensed">
        <tr>
            <th>Album</th><th>Release</th><th>Producer</th><th>Label</th><th></th>
        </tr>
        <tr ng-repeat="album in louDrops.releases">
            <td>{{album.album}}</td>
            <td>{{album.releaseDate|date}}</td>
            <td>{{album.producer}}</td>
            <td>{{album.label}}</td>
            <td><img src="{{album.image}}" alt="{{album.album}} Cover Image" width="300px;" height="300px;"></td>
        </tr>
    </table>
    </div>

Again, we have done this before. The interesting thing to note though is the album release date. JavaScript and
dates are something that make me a little crazy, but having said that, AngularJS does a nice job. You can pass
a JSON date object to a filter and have it format, ``{{album.releaseDate|date}}`` as above. More info on the ``date``
at the [AngularJS](http://docs.angularjs.org/api/ng.filter:date#!) site.

The second thing to notice is we are using a ``src`` attribute in our ``img`` tag. Things are loading fine, but if
you look at the page load, you will actually see a 404 error that happens.

![404 Error on image Get](404Error.png)

This is because the AngularJS functionality is executed AFTER the page loads. We are still making the get request
that the ``src`` attribute had identified. With ``src`` attributes and ``href`` tags you are building that reference
AngularJS objects, this is something to be cognizant of. The fix is easy enough, we just prepend a ``ng`` tag on our
attribute. This will then be part of the page processing that happens during the Angular load. Our image reference
is now

``xml
<img ng-src="{{album.image}}" alt="{{album.album}} Cover Image" width="300px;" height="300px;">
``

<h3>Adding ng-src</h3>
 <div id="louTable1"  ng-controller="louCtrl" >
    <table class="table table-striped table-bordered table-hover table-condensed">
        <tr>
            <th>Album</th><th>Release</th><th>Producer</th><th>Label</th><th></th>
        </tr>
        <tr ng-repeat="album in louDrops.releases">
            <td>{{album.album}}</td>
            <td>{{album.releaseDate|date}}</td>
            <td>{{album.producer}}</td>
            <td>{{album.label}}</td>
            <td><img ng-src="{{album.image}}" alt="{{album.album}} Cover Image" width="300px;" height="300px;"></td>
        </tr>
    </table>
</div>

The last thing to hit on is on the image loading, and a cool little trick I learned. One of the customer sites
I work at it is using AngularJS and they are integrating with a third party data source. What they wanted to be
able to do is not show a broken or missing image. I sat there and thought to myself that this is going to be
pretty difficult. Our client side scripting language was going to have to not call the source directly, but go
through some kind of nutty proxy we would develop, etc. It wasn't goig to be fun. However, a little time
on the [Google](http://www.google.com) found a MUCH easier way to get by this.

To expand, our images are coming from Wikipedia and reference images they have for entries on Lou Reed albums. If
one of these images changes, we would get an error and display a X on our page. To illustrate, I have created a
second controller where we change the image for Metal Machine Music and Transformer so they would return 404s.

We now are receiving missing image links in our page. This is NOT use friendly

![404 Error on Album Cover](LouCover404.png)

You can see the example below

<h3>Missing Images in Javascript Object</h3>

   <div id="louTable2"  ng-controller="lou2Ctrl" >
        <table class="table table-striped table-bordered table-hover table-condensed">
            <tr>
                <th>Album</th><th>Release</th><th>Producer</th><th>Label</th><th></th>
            </tr>
            <tr ng-repeat="album in lou2Drops.releases">
                <td>{{album.album}}</td>
                <td>{{album.releaseDate| date:'medium'}}</td>
                <td>{{album.producer}}</td>
                <td>{{album.label}}</td>
                <td><img ng-src="{{album.image}}" alt="{{album.album}} Cover Image" width="300px;" height="300px;"></td>
            </tr>
        </table>
    </div>

The fix is easy enough though! We can add an on error function within our ``img`` tag. First, we want to add a
default local image we can reference. So let us use the Wikipedia image that I have at the top of our page.

Within our ``img`` tag we add an ``onerrror`` function like so

``
 onerror="this.src='Lou_Reed.jpg'"
``

so that our entire ``img`` tag is now

``xml
<img ng-src="{{album.image}}" alt="{{album.album}} Cover Image" width="300px;" height="300px;">
```

and we now handle missing images on page load (with ng-src) and missing images in our data source, with
onerror.

 <h3>Resolve missing images</h3>
    <div id="louTable3"  ng-controller="lou2Ctrl" >
        <table class="table table-striped table-bordered table-hover table-condensed">
            <tr>
                <th>Album</th><th>Release</th><th>Producer</th><th>Label</th><th></th>
            </tr>
            <tr ng-repeat="album in lou2Drops.releases">
                <td>{{album.album}}</td>
                <td>{{album.releaseDate| date:'medium'}}</td>
                <td>{{album.producer}}</td>
                <td>{{album.label}}</td>
                <td><img ng-src="{{album.image}}" alt="{{album.album}} Cover Image" width="300px;" height="300px;" onerror="this.src='Lou_Reed.jpg'" ></td>
            </tr>
        </table>
    </div>
</div>


<script type="text/javascript" src="/2014/01/angularjs-lou-reed/js/louApp.js"></script>
<script type="text/javascript" src="/2014/01/angularjs-lou-reed/js/louController.js"></script>
<script type="text/javascript" src="/2014/01/angularjs-lou-reed/js/louController2.js"></script>