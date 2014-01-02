---
layout: post
title: HTML 5: A Little History
date: 2011-06-28
tags: ["HTML 5","Web"]
---

HTML 5 is being proposed as a magic potion for all that ails the world of developers. It slices, it dices, it chops and even calls your mom on her birthday when you forget. Let's jump on the bandwagon!

To understand HTML 5, first you'll need a bit of history... HTML is a standard, standards are created by standards bodies, and they can take a while. The HTML standard is created by the World Wide Web Consortium (W3C), with the last HTML standard being [HTML 4](http://www.w3.org/TR/REC-html40-971218/), which was published in December of 1997\. At that point, the W3C essentially said HTML is dead, long live HTML, but in the form of XHTML, a break from the previous version of HTML with HTML being recreated as strongly formed XML.

The introduction of XHTML had one problem though; XHTML "broke" the internet. It didn't literally break it in the sense that you couldn't get your White Sox scores from ESPN, but without massive rewrites, it would have. HTML has always been a "forgiving" standard. If I develop an HTML page and have an opening <P> tag but not a corresponding closing </P> tag, my page will (most likely) work. XHTML would have resulted in a fatal error. People have estimated that fully implementing the XHMTL specification would have resulted in 99% of HTML pages at the time not rendering properly.

So, our journey to the way back machine brings us to 2004, HTML 4 is the last W3C standard and their work has been focused on XHTML since 1997\. During this time, XHTML has NOT taken off in the marketplace. People still want their White Sox scores from ESPN. As a result, browser developers, some web development companies, and some W3C members got together and proposed evolving HTML 4 with new features for modern browsers since a lot had changed in the years since the last standard (2004 -1997 = 73 Internet years). The W3C said they were not interested but the folks who proposed extending HTML WERE interested and went off and created the [Web Hypertext Application Technology (WHAT)](http://www.whatwg.org/news/start)working group. So here is the state of the world: the people responsible for the HTML standard are not evolving the HTML standard any more, the folks who implement the HTML standard (the web browser creators, the app tool creators, etc.) want to evolve HTML.

So the WHAT group went on doing its thing. Their main goal was backward compatibility. They wanted to be able to evolve HTML without breaking the 10 years of web development that came before. One of the more interesting things they did was explicitly identifying HOW to parse HTML so that it would be compatible across all browsers. In some ways, that became a new standard that indicated how all browsers should work.

They also went on and introduced new features into HTML (without breaking HTML) including new form elements for things like dates. They thought, "Wouldn't it be swell if browsers natively supported video and audio so we could get rid of things like Flash for streaming video?", so they added it. They also thought, "Wouldn't it be awesome if you could animate things directly in the browser?", so they added a drawing canvas to HTML.

The industry responded positively to these new ideas and the WHAT group started gaining momentum. During this time the W3C was working on XHTML 2, which none of the browser vendors implemented. I'm not sure what you call a standard that nobody implements, but whatever you call it, it's pretty useless. It got to the point where in October of 2006, the W3C and the WHAT working group decided to join forces and evolve HTML and create HTML 5.

Today we are at a point where these two groups are working together to create the HTML 5 standard. The next question is WHEN will there be an HTML 5 standard? It's going to be a while, maybe as far out as 2022 or later. So is that a problem? The answer is, hopefully not.

Part of the reason for the long time is that the HTML 4 specification is very vague or even undefined on how things work. If you forget to include your closing paragraph tag, it was up to the browser vendor to figure it out. This leads to different implementations across vendors so things don't work as expected across all the browsers, something you are no doubt very familiar with. As a first step, sometime in 2012, a candidate recommendation for the HTML 5 standard will be released. At that point, the feature set, already very close to being final, will be official. A good part of the remaining 10 years will be spent on officially documenting how the standard should parse HTML.

Another, even more important thing, is that the HTML 5 team is working on test suites. The idea is that browser vendors will have to run their browsers against the test suite and not until they hit 100% in a test suite will they be considered to have passed. In a lot of ways, the test suite becomes the standard. In fact, not until two major browser vendors pass the test suite with 100%, will the standard be considered completed. This is part of the reason for the very long elapsed time.

The other player in this is how HTML 5 works other devices. HTML 5 is or will be supported by all major smart phone vendors as well as tablet vendors, e-readers and most likely a plethora of things not even imagined yet. In fact, some sites, such as the ubiquitous Facebook, are rumored to be developing HTML 5 applications rather than native applications for mobile or tablet vendors. Part of the reason for this is that some of the hardware vendors are requiring essentially a commission on any purchases within a native application. As a result, a lot of sites may be looking to bypass the App Store approach and create [native HTML 5](http://www.zdnet.com/blog/facebook/rumor-facebook-to-take-on-apple-with-html5-platform/1612)so they don't need to worry about giving hardware vendors a percentage of their revenue.

HTML 5 is a lot of hope and promise. In the past I have called it Java-esque, in the promise of the write once, run everywhere. What is different this time? A couple of things, one is the test suite that browser vendors will need to pass. The other is that there really seems to be a good cross section of the industry that REALLY wants this to work. It's not often that Apple, Google, Microsoft and other big companies are working towards the same thing. Do they always agree? Of course not! Will it cause problems? It already is. However, the industry is working hard to make this a reality.

It will be interesting to see how it all plays out. Browsers like Google Chrome are working hard on supporting HTML 5 across many platforms. IE is working towards supporting HTML 5 on the Windows platform using hardware acceleration. You will see differences where HTML 5 rendered using IE which will run much faster and can do more, so that performance issues of other browsers may be a concern. Vice-versa you can have issues where IE is not rendering something the same way Chrome is.

It's a long article just discussing the history of HTML 5 with none of the introduction of what HTML 5 is. However, it's important to understand the history of how we got here, and why the industry thinks this will be important. Next time I'll actually discuss some of what's new in HTML 5!

**Why Use it?
**HTML 5 is going to (soon) be the industry standard for web applications

**I want to learn more!
**[Interview with Ian Hickson discussing HTML 5 adoption rates](http://www.techrepublic.com/blog/programming-and-development/html-5-editor-ian-hickson-discusses-features-pain-points-adoption-rate-and-more/718)

This blog post originally appeared at Skyline Technologies ([http://www.skylinetechnologies.com/blog/Pages/HTML_5_History.aspx](http://www.skylinetechnologies.com/blog/Pages/HTML_5_History.aspx))