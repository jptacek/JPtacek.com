---
layout: post
title: Twitter Bootstrap Themes
date: 2014-03-17
tags: ["Twitter BootStrap","Web","CSS"]
---

With a name like Ptacek, you would of course, have to know I am half-Irish. So, to celebrate, we are going to wrap
up a St Patrick's Day theme for the blog today (3/17/14). You may be saying to yourself, how could I spend so much time and effort totally
retheming the blog to support a relatively minor holiday on the calendar? Easy! Twitter Bootstrap themes!

Twitter Bootstrap, is obviously, a very popular web CSS framework. It enables web developers, without a lot of CSS expereince to
quickly create responsive sites that look decent out of the box. One of the interesting things you can do with version 3 of
Twitter Bootstrap is quickly  update your site easily using themes.

With Twitter Bootstrap, there are two ways you can do things. Option 1 is to download the minified files. This will result in three
separate files, ``bootstrap.min.css`` , ``bootstrap-theme.min.css`` and ``bootstrap.min.js``, which
is used in conjunction with jQuery. The theme elements are then contained in the ``bootstrap-theme.min.css`` file.

The second approach you can use is to download the source files and compile the CSS yourself. This is done by downloading
[LESS](http://lesscss.org/) files and using your favorite LESS compiler to generate CSS. There are also SASS files for the
 Ruby fans of the world. With the LESS approach,
there are separate files for theming, a ``variable.less`` file and a bootstrap theme file. This is the approach I use for this site
and most projects I start. Within the main ``site.css`` LESS file I import the theme files

```xml
@import "bootstrapTheme/bootswatch.less";
@import "bootstrapTheme/variables-bootswatch.less";
```

The reason I like using the LESS approach rather than just downloading the minified CSS files is the theme part is a bit more
isolated. I can keep all the theme content, which I really think of as the "skin" for a Bootstrap site, in two separate files.
This enables new versions of Bootstrap to be downloaded without loosing other CSS changes and to quickly swap them out, like we
are doing here for St. Patrick's Day.

It should be noted, that out of the box, Twitter Bootstrap ships with a default theme, a theme that makes the site look like
Twitter Bootstrap 2.x. There is quite a growing community for creating themes for bootstrap (it's not WordPress type size,
that would just be crazy talk). Example sites include [WrapBootstrap.com](https://wrapbootstrap.com/), [Bootstraptor](http://bootstraptor.com/)
and the one I tend to gravitate to, [Bootswatch](http://bootswatch.com/).

To update your site UI you just simply download either minified CSS files and swap them out, or two LESS files and then reference
them in your site. Since I use LESS, I download the LESS files, rename them to a theme name, which allows me to keep my original,
and then update my ``site.css.less``. I called the St Patrick's Day theme shamrock and my references are now


```xml
@import "bootstrapTheme/shamrock-bootswatch.less";
@import "bootstrapTheme/shamrock-variables.less";
```

Viola, a save and a publish later we have a total site look! It is like [CSSZenGarden](http://www.csszengarden.com/) for
mortals.

 <img src="http://www.jptacek.com/2014/03/Twitter-Bootstrap-3-Themes/BuildStPatty.png" class="img-thumbnail" alt="Rules" />

You can find the St Patrick's Day theme I downloaded from Bootswatch [here](http://bootswatch.com/shamrock/). Obviously,
 since this is just for a short time, there are some UI things that would need to be redone on the site, but we will
 be back to our regularly scheduled programming soon!

Totally useless Ptacek news.... Obviously, the half Irish comes from my Mother's side. My Uncle [Tom Durkin](http://en.wikipedia.org/wiki/Tom_Durkin), a somewhat famous horse
race announcer who [used to call](http://www.nytimes.com/2011/04/28/sports/28durkin.html?version=&action=click&adxnnl=1&region=searchResults#0&module=Search&url=http://query.nytimes.com/search/sitesearch/#/tom+durkin/&pagewanted=all&adxnnlx=1395057931-WaqX7ynUlBWydjqQznsZ1w) the Kentucky Derby and other Triple Crown races on television, would often get flown over
to call the Irish Derby. Here is one of my favorite race calls he has ever done, but probably more appropriate for Talk
Like a Pirate Day

<iframe width="420" height="315" src="//www.youtube.com/embed/nf0wQzq9Yzg" frameborder="0" allowfullscreen></iframe>


Happy St. Patrick's Day!