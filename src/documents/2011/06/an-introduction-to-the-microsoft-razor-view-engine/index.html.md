---
layout: post
title: An Introduction to the Microsoft Razor View Engine
date: 2011/06/24
tags: ["Razor","Web","WebMatrix"]
---

In past blog posts on [MVC](http://www.jptacek.com/2011/06/comparing-asp-net-mvc-and-web-forms/) 
and [WebMatrix](http://www.jptacek.com/2011/06/webmatrix-proves-an-excellent-tool-for-creating-small-sites-quickly/). 
I've mentioned Razor. Today, I'm going to get a bit more in depth on Razor and what it can do.

ASP.NET MVC supports view engines. All web programming consists of providing developers a way to insert 
data dynamically into their HTML output. In ASP.NET Web forms, this was done using <%= =%> syntax to let 
the runtime know that code was coming. In previous versions of ASP.NET MVC, this same approach was 
used and was called the Web Forms view engine.

ASP.NET MVC, however, had the ability to use other view engines. Ever since the introduction of MVC, 
people have not liked using the Web Forms View engine. During that time, several other view engines 
became popular for MVC development including [Spark](http://sparkviewengine.com/), 
[StringTemplate](http://code.google.com/p/string-template-view-engine-mvc/) and 
[NHAML](http://code.google.com/p/nhaml/).

With the release of ASP.NET MVC 3, Microsoft is now using the Razor view engine. You can still use the 
previous Web Forms view engine if you would like. The team at Microsoft outlined several design goals for 
Razor when they introduced it. The most important ones are that Razor be compact, expressive and 
fluid as well as easy to learn.

One of the main complaints with the Web Forms View engine is how verbose the syntax was. 
Razor explicitly address this by using the @ keyword to enable script escaping.

So what does this code look like? First, Razor files have the extension csHtml (C# Syntax) or 
vbHtml (VB syntax). Razor files then get processed by the runtime. If we have a variable defined 
message and have an HTML stream going, you can see the razor terseness in the following syntax:

```xml
<p>Message for the user @message</p>
```

In ASP.NET Web Forms, this same line would have been
```xml
<p> Message for the user <%= message %></p><
```

Similarly, for example, if we have a list of sports teams showing their name and what place they are in and we want to iterate through to display the standings the syntax is:

```xml
<h3>Teams</h3>
<ul>
@foreach (var t in teams) {
<li>@t.Place - @t.Name </li>
}
</ul>
```

On the screen this would print as follows:
```xml
<h3>Teams</h3>
    <ul>
        <li>1 - Green Bay Packers</li>
        <li>2 - Chicago Bears</li>
        <li>3 - Detroit Lions</li>
        <li>4 - Minnesota Vikings</li>
    </ul>
```

Similar syntax with Web Forms:
```xml
<h3>Teams</h3>
<ul>
    <% foreach (var t in teams) { %>
        <li><%= t.Place%> - <%=t.Name%> <li>
    <%}%>
</ul>
```

Razor also supports HTML Helpers, which are a way for users to create HTML snippets across their code. So in the example above, we could create an HTML Helper to create the football standings and use it multiple times in our view or across multiple views. The syntax is as such:
```xml
@helper TeamStandings(FootballTeam team) {
    <li>@team.Place - @team.Name </li>
}
```

We could then update the page to call the helper:
```xml
<h3>Teams</h3>
<ul>
    @foreach (var t in teams) {
        @TeamStandings(t)
    }
</ul>
```

You can see how less verbose the syntax is to use. It is also, in a lot of ways easier to use. You never need to remember if you should escape out using <% or <%= either. The Razor syntax also introduces new syntax for laying out pages, superseding the ASP.NET concept of master pages. In truth, the ideas are both the same, but the concept is now called LayoutPages. Instead of having ContentPlaceholder sprinkled throughout a master page, helper methods in the template are used to fill in specific content. For example, let's call this page _groovySiteLayout.cshtml:
```xml
<html>
<head>
    <title>Groovy Page</title>
</head>
<body>
    <div id="groovyMenu"><a href="/">Home</a></div>
    <div id="groovyPageBody">
        @RenderBody()
    </div>
</html>
```

Then, within the view, we create our site content which includes a setting for the layout page. When the layout page hits the @RenderBoy helper method it injects the view content into the layout page and sends back to the browser.
So for a simple view:
```xml
{
    @LayoutPage = "_groovySiteLayout.cshtml";
}
<h1>Welcome to Groovy</h1>
<p>Hello world</p>
```

Would render the following HTML:
```xml
<html>
<head>
    <title>Groovy Page</title>
</head>
<body>
    <div id="groovyMenu"><a href="/">Home</a></div>
    <div id="groovyPageBody">
        <h1>Welcome to Groovy</h1>
        <p>Hello world</p>
    </div>
</html>
```

There is a lot more to the Razor view engine, this is just a quick introduction, 
I will be talking about it a lot more in the future.

**Why Use it?
**Razor is a new Microsoft view engine that is lightweight and easy to use. 
It is currently part of WebMatrix and ASP.NET MVC. There are even indications it will be an integral part of a future version of ASP.NET WebForms.

**I want to learn more!
**• [Microsoft Introduction](http://weblogs.asp.net/scottgu/archive/2010/07/02/introducing-razor.aspx) - This post on Scott Guthrie's blog is an excellent introduction!
• [Microsoft ASP.NET MVC site](http://www.asp.net/mvc) - Check out the pluralsight videos on the page
