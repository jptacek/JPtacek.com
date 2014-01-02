---
layout: post
title: Comparing ASP.NET MVC and Web Forms
date: 2011-06-10
tags: ["MVC","Web","Web Forms"]
---

Before we get into MVC proper, let's discuss why you should consider MVC at all. It's my personal feeling that MVC 3 is going to be a horrifically important technology for all of us. If you're moving into more mobile development, MVC is going to be a much better choice. Secondly, in a HTML 5 world, MVC is going to be a better choice due to its ability to control HTML markup and reference client IDs via JavaScript. It's not to say ASP.NET Web Forms will not allow for this kind of development, but as the current Web Forms platform exists, it will be more difficult. An example of this..., having the ViewState be part of HTML pages on mobile browsers can have significant impact on load times. Okay, time to jump off the soapbox.

MVC stands for Model-View-Controller. In my mind, I think of it this way ... model is really our data or more correctly, business object. The model contains the data we want to render. The view is the page that we use to render the data. The controller is essentially the traffic cop that tells the data, what view it needs to go to. Most of this is handled automatically by MVC's concept of [convention over configuration](http://en.wikipedia.org/wiki/Convention_over_configuration).

It all works something like this ... a user hits a URL and the controller gets called, based on routing rules it knows which controller to go to. The controller then loads the model from the database. Once the model is populated it then determines what view to load and passes the model to the view for rendering. One of the benefits of an approach like this is that the view is very lightweight with little code in the view proper. The code there is just for helping to render the data. This naturally leads to separation of concerns, which is always a good development practice that is hard to follow in Web Forms.

One of the reasons for converting a site to MVC is to create both an HTML 5 version of the site and a mobile HTML version. In this scenario the controller would load one version of the data (aka the model), but based on the type of browser accessing the site, pass the model to a different view, for example the HTML 5 view. You can get a glimpse of the power. No matter the type of site we have, we are always accessing our data in the same way and passing the view.

So, is ASP.NET Web Forms dead? Of course not! The real genesis of ASP.NET Web Forms was to provide an easier migration path for VB/Winform developers, who were familiar with event driven programming, into the stateless world of the web and web programming. Essentially, Web Forms abstract away the stateless nature of the web. As our paychecks prove, it's a great programming platform running millions of sites. Microsoft will continue to support Web Forms.

There are times when Web Forms will make sense, and times where MVC will make sense. At a high level:

**Advantages of Web Forms:**

*   Developer Familiarity
*   VERY rich eco system of server controls
*   Provides a RAD development environment
*   Event driven system
*   Much easier development for data heavy LOB system
**Advantages of MVC:**

*   Full control over HTML
*   Easy integration with JavaScript frameworks
*   Embraces the stateless nature of the web
*   Easier Search Engine Optimization
*   Allows for better testing
At the end of the day, both MVC and Web forms are platforms built on ASP.NET and use the same runtime. HTML and HTML 5, while always an important part of what we do, are becoming more and more important. If you ever needed verification of this, Microsoft's [recent announcement](http://www.microsoft.com/presspass/features/2011/jun11/06-01corporatenews.aspx)that Windows 8 would allow for the distribution of HTML 5 apps to Windows reinforces that. MVC and Web Forms are both platforms we need to make our customer successful in this kind of environment. While I feel MVC is going to be a preferred platform for HTML development, the truth is both platforms are suited for the creation of HTML sites.

**Why Use it?
**ASP.NET MVC is a platform for developing HTML applications that provides the user much greater control over the HTML markup that is rendered. There are added benefits such as supporting testing and better code design too!

**I Want To Learn More!**

[Professional ASP.NET MVC 2](http://www.amazon.com/Professional-ASP-NET-MVC-2-ebook/dp/B003RCJE9Q/ref=sr_1_2?ie=UTF8&qid=1307102102&sr=8-2)(book)

[ASP.NET MVC 2 in Action ](http://www.amazon.com/ASP-NET-MVC-Action-Jeffrey-Palermo/dp/193518279X/ref=sr_1_2?ie=UTF8&qid=1307102138&sr=8-2)(book)

[Pro ASP.NET MVC V2 Framework ](http://www.amazon.com/ASP-NET-Framework-Experts-Voice-NET/dp/1430228865)(book)

[Microsoft ASP.NET MVC site](http://www.asp.net/mvc)- Check out the pluralsight videos on the page!

[StackOverflow question on Web Forms vs MVC](http://stackoverflow.com/questions/102558/biggest-advantage-to-using-asp-net-mvc-vs-web-forms/3629415#3629415)

Along this same line there is great NuGet package that you can use with MVC3 and EF 4.1 that will generate your views, controllers and Repositories. Yes, a code-gen tool that adheres to real world architecture practices, from your true POCO model classes. [Check it out](http://blog.stevensanderson.com/2011/01/13/scaffold-your-aspnet-mvc-3-project-with-the-mvcscaffolding-package/).

&nbsp;

This blog post orginally appeared at Skyline Technologies ([http://www.skylinetechnologies.com/blog/Pages/mvcaspnet.aspx](http://www.skylinetechnologies.com/blog/Pages/mvcaspnet.aspx))