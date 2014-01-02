---
layout: post
title: HTML 5 Markup
date: 2012-03-22
tags: ["HTML 5","Skyline Technologies","Web"]
---

Here's another post in my series about the technology for the [Riverview Gardens Give Camp](http://www.skylinetechnologies.com/news/Pages/RiverviewGardensGiveCamp.aspx) Skyline held recently. One of the great things about the Give Camp was the learning opportunities for our associates.

The emerging HTML 5 standard has many new and interesting pieces that make it a great tool for developing web based applications. Let's take a look at some of the new tags. 

New Input types 
HTML 5 introduces many new input types, that make it easier for end users to enter data. Here is a quick list:

In general, the new input types will validate that an input is in the expected format (i.e. email or url) and display a message to the user. 

<p?All of these attributes are implemented in various shapes and forms across the browser vendors. For example, IE 9 does not, at this point support any of the input types, though many are supported in IE 10\. They also are implemented differently across the various browser vendors. The good news is your pages will still render as generic input boxes if it does not recognize the new types. </p>

Some of the inputs are not things that can be validated, like tel, which indicates a telephone number, because of the many different phone number formats across the globe. So why use it at all? Because by explicitly identifying the input type, we are better able to describe the purpose of the input. It becomes useful on things like mobile websites where a mobile browser can immediately display a number pad rather than an alpha keyboard. 

Another slick feature is the introduction of the placeholder attribute. When creating an HTML form, the placeholder will display information about the text. Once the user places focus on the input, it disappears. In Chrome, the following markup:

<pre class="brush: xml;"><input type="email"/></pre>

Renders: 

[![HTMLMarkup2](http://www.jptacek.com/wp-content/uploads/2012/10/HTMLMarkup2.jpg)](HTMLMarkup2.jpg)

Semantic 
Another focus of HTML 5 is the introduction of new sematic elements. The semantic elements exist to more explicitly identify what your document items are. This is helpful for web pages which need to be used by screen readers, or to search engines in trying to parse the content of your document. 
The first part of semantic is the introduction of several new tags that define your HTML document structure. They are: 

There are several more semantic elements, but you get the gist of it. It is important to remember these elements don't really DO anything for presentation on the page. You are still responsible for styling your header or footer, or providing navigation elements each time you render the page into the nav element. What it does do is describe your document. 

A second part of semantics is the use of microdata to even further describe your document. More can be learned about microdata in a previous blog post. 

More elements 
There are new video and audio tags to explicitly play, wait for it... big surprise coming, video and audio files in your browser without requiring plugins. The reality however gets pretty complicated pretty quick. All of the vendors have a "preferred" video format, the reality of which results in you having to encode your video to support these various vendor specific implementations. 

<pre class="brush: xml;">
<audio src="StuckBetweenStations.mp3" controls autoplay /> 

<video src="WhiteSoxVsBrewersWorldSeriesGame1.mp4" controls height="200px" width="400px" />
</pre>

The canvas tag purpose in life is really a drawing surface. You can draw and animate using JavaScript and style elements across the canvas tag. This is another way of saying, let's make some games. The canvas obviously serves other purposes, but it is a deep topic we will just introduce here. 

There you go ... a high level introduction into some of the new HTML tags that are part of HTML 5\. Next we will discuss some programming items, such as persisting data.