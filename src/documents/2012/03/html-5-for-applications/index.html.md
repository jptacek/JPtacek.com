---
layout: post
title:  HTML 5 for Applications
date: 2012-03-21
tags: ["HTML 5","Web"]
---

Long ago, in a land far, far, away, I started an [introduction to HTML 5](http://www.skylinetechnologies.com/blog/Pages/HTML_5_History.aspx) by giving a short history of HTML and the standards process. It was to quickly be followed up with an overview of what is meant by HTML 5 applications. Months later, here we are....

With the [Skyline Give Camp](http://www.skylinetechnologies.com/news/Pages/RiverviewGardensGiveCamp.aspx) just behind us, I thought I would kick off a wave of blog posts about some of the technology we will be used during the Give Camp. First up, let's discuss HTML.

There has been a lot (and I mean a lot) of enthusiasm for HTML 5 for creating applications, but what does that really mean? In general, I believe there are two things people mean when they discuss HTML 5\. The first is the HTML standard itself. The second is creating applications using HTML 5\. We will touch on each of those.

**HTML 5 Standard**
The HTML 5 standard is really the evolving standard being created by the WC3 and WHAT working group. It is the new parts of the angle bracket goodness that keeps food on a lot of our tables. A lot of what Skyline does is creating applications for our clients where we render HTML server side and send it down to browsers to be rendered. HTML 5 has a lot of new markup tags and attributes to make these types of applications more interactive, discoverable and intuitive for users.
I'll discuss these new attributes in more depth in future blog posts.

**HTML 5 Applications**
The real excitement about HTML 5 is for HTML 5 applications. HTML 5 applications can, obviously, be a lot of different things to different people. At its root, is to have HTML 5 be a light container, and then to use JavaScript/jQuery to inject data into the markup.

A way to think about this ... We have done a lot of work with Silverlight. The model we have for that is MVVM (Model-View-ViewModel). At a very high level, this concept involves a View, which has nothing in it other than screen layout and design, a model (our entities or data model) and the ViewModel, which is responsible for getting data and binding itself to the view. In this scenario, the view is very light weight and has no logic, the ViewModel is where all the heavy lifting occurs.

There is a very shaky analogy to this in HTML 5 based applications. Often, you will have an HTML page that consists of markup. Essentially it is the bare bones implementation of the User Interface. This will be sent down to the browser for display. Part of the markup though includes JavaScript references. The JavaScript functions will then call back end data services and inject that data into our view. For example, the following markup could be sent down to a browser
<pre class="brush: js">
<div data-role="content">
<div id="twitList"></div>
</div><!-- /content -->
A Javascript or jQuery function could then be sent to "inject" markup into the HTML, such as
<script type="text/javascript">
$(function () {
console.log("binding attempat");
$.ajax({
url: "http://search.twitter.com/search.json?q=SkylineTweets",
dataType: 'jsonp',
success: function (json_results) {
console.log(json_results);
$('#twitList').append('<ul data-role="listview"></ul>');
listItems = $('#twitList').find('ul');
$.each(json_results.results, function (key) {
html = '<a class="avatar" href="#"><img src="' + json_results.results[key].profile_image_url + '" alt="' + json_results.results[key].from_user + '"/></a>';
html += '<a href="http://twitter.com/' + json_results.results[key].from_user + '"><h3>' + json_results.results[key].from_user + '</h3></a>';
html += '<span class="details">' + json_results.results[key].text + ' </span>';
listItems.append('<li>' + html + '</li>');
console.log(html);
});
// Need to refresh list after AJAX call
$('#twitList ul').listview();
}
});
})
</script>
</pre>
This will result in the retrieved results for [@SkylineTweets](https://twitter.com/#!/skylinetweets) Twitter feed being injected into the HTML markup as an Unordered List (UL).

Obviously, there are a lot more pieces involved in creating HTML 5 applications. The important thing to take away is that HTML is now considered a programming language. Through a combination of HTML 5 and JavaScript/jQuery, developers are creating great applications. Microsoft's next version of Windows, Windows 8, even supports HTML and JavaScript as a native programming language.

The concept of HTML being a view, and JavaScript being the tool to inject data into the view is an important one to understand!

This blog post originally appeared at Skyline Technologies ([http://www.skylinetechnologies.com/blog/Pages/HTML5applications.aspx](http://www.skylinetechnologies.com/blog/Pages/HTML5applications.aspx))