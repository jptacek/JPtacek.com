---
layout: post
title: Saying Hello to.... DocPad
date: 2013-12-29
tags: ["WordPress","Blog","DocPad"]

---

I recently [blogged](/2013/12/saying-goodbye-to-wordpress/) about moving off of WordPress to a new blogging platform.
I have been looking at several different options during this time and have finally picked one. There were three that really piqued my interest; [Ghost](http://www.tryghost.org), [Jekyll](http://jekyllrb.com/) with hosting on Github, and [DocPad](http://docpad.org/).

Each of the platforms had different things that made it interesting to me, and some things I did not like. Let's review each of them

##Ghost##
![Ghost Logo](GhostLogo.png)

I think [Ghost](http://www.Ghost.org) is pretty awesome. When I started thinking about redoing my blog, it had a lot of things I was interested in. The platform is elegant. It uses Markdown for creating content, and the online editor for it is VERY nice. The other thing that really interested me is that it is all built on Node.JS. This is a platform I am definitely interested in growing my skill base.

However, despite all of these things, Ghost was not for me. In reality, is another blogging/CMS platform. The same limitations I was having with WordPress, in terms of page structure, adding JavaScript content, etc, would still be an impediment on Ghost. Essentially, Ghost is WordPress 2.0, a MUCH nice WordPress, hosted with Node.JS instead of PHP, but not for me and the things I would like to do.

##Jekyll##
![Jekyll Logo](JekyllLogo.png)

[Jekyll](http://jekyllrb.com/) was VERY close to being what I chose. The magic of Jekyll is that it creates static HTML from templates. Essentially, you create a page layout. You can then create posts and content using Markdown to be combined with your layout and it will create static HTML. By serving up static HTML, your hosting costs quickly become much less since you are serving up static pages, and millions of web servers over the world are VERY good at that.

Jekyll also has the added benefit of being tied to [GitHub](http://www.GitHub.com) and its [GitHub Pages]( http://pages.github.com/) platform. I can have the fine folks at GitHub and their operations folks be responsible for ensuring my site is up. It also has some slick features where you check in your Markdown file in GitHub and your site content is automatically deployed.

However, like Goldilocks finding the porridge a bit too cool, there were some things that steered me away. First, while the automatic updating feature is slick, it is a limited subset of the Jekyll functionality. Further, Jekyll is based on the Ruby programming platform. While I find that more interesting than WordPresss’ PHP, it is definitely not as high up on my list as Node.JS.

Which brings us too….

##DocPad##
![DocPad Logo](DocPadLogo.png)

Ultimately, I ended up picking [DocPad](http://docpad.org/). I REALLY liked the idea of static page generation. I have been around the web now that it is all back where it started, with developers putting static HTML files on a server. Who would have thunk? Of course, this is much nicer since you have templates to go and create the site. It is also a Node.JS application, which is of interest. You can also auto deploy your markdown files and have it create the static HTML in an Azure web instance after you commit and push your changes to GitHub. VERY SLICK. Of course, I pay for the CPU part of that, and only when I create content. The rest will all be static HTML files being sent by IIS.

It is really very slick how easy the site setup was. I will detail my instructions down the road. I do LOVE the Node Package Manager and the magic of package.json which allows you to quickly get a site up and running on your machine.

I give a lot of credit to the site redo to my old [Skyline](http://www.SkylineTechnologies) colleague and now Microsoft guy, [Jason Young] (http://www.yTechie.com). As I was investigating my next blog platform, he published a [post]( http://www.ytechie.com/2013/11/blogging-awesomeness-with-a-static-generator-and-markdown/) about migrating his site to DocPad. The gold star for Jason was taking the DocPad site and configuring Azure to compile the markdown to static HTML and then set for hosting. This is what moved me from going to Jekyll to Docpad. VERY COOL!

Also, hat tip to [Erv Walter](http://www.ewal.net/) for great stuff he did in setting up the platform and UI that Jason and I have both, VERY liberally borrowed from.

Obviously, my site has a lot of UI cleanup I would like to do, I also need to edit a lot of posts, but here it is, in all of it's static glory.

##Conclusion##

Why DocPad

* Node.JS platform
* Templating engine to allow creation of static HTML files
* Enable Javascript on pages
* Auto publish from a GitHub repository
* Markdown language for publishing
* Lots of extensibility via Plugins

[Erv Walter GitHub repository for Ewal.net](https://github.com/ervwalter/ewalnet-docpad)

[Jason Young GitHub repository for Ytechie.com](https://github.com/ytechie/ytechie-docpad)

[My GitHub repository for JPtacek.com](https://github.com/jptacek/JPtacek.com-docpad)

