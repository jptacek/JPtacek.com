---
layout: post
title: National Pi Day 2018
date: 2018/03/14
tags: ["Pi","Ephemera",,"Skyline Technologies"]
---
    
 
In honor of [National Pi Day](https://en.wikipedia.org/wiki/Pi_Day) in the US, we are going to revisit an [old blog post](https://jptacek.com/2013/03/have_your_pi/) where we compared the performance of C# to C++.
 
This is a really simple comparison, but we can still learn a few things!
 
We are going to use a VERY slowly converging series to calculate π to 15 decimal points, which takes close to 100 million iterations to accomplish. The formula is the [Leibniz Formula](https://en.wikipedia.org/wiki/Leibniz_formula_for_%CF%80) and can be represented as a mathematical series as such:
 
![Leibniz series for computing Pi](piLeibniz.png)

Microsoft has been hard at work, rewriting their .NET platform from the version that has powered enterprises over the last 15 years, to a more platform agnostic, open source version called [.NET Core](https://www.microsoft.com/net/).
 
We thought it would be interesting to compare .NET Core calculations to the previous .NET Classic calculation that was written in C#. We also decided to compare the very popular [Node.js](https://nodejs.org/en/) runtime, which drives a lot of web development, both with [NPM](https://www.npmjs.com/) for client development and on the server.
 
There were 10 iterations of each code run on Windows 10. You can find the code on Skyline’s [Github](https://github.com/SkylineTechnologies/) account at [pi-day-leibniz](https://github.com/SkylineTechnologies/pi-day-leibniz).
 
![win10 dot net node classic](piDayLang.png )

As we can see, the performance of .NET Core is pretty impressive on Windows! Three times as fast than .NET Classic and 7 times faster than Node.js. This passes the smell test too. We expect a more modern rewrite of .NET to perform better. Node.js is also an interpreted language, so it will not be as fast as compiled code.
 
We then compared the performance of .NET Core and Node.js across operating systems on the same machine, in this case, [Ubuntu](https://www.ubuntu.com/) 17.10 and Windows 10. Since both code bases are multi-platform, we can see how they compare across OSes.
 
![ubuntu dotnet node](piDayCompareOS.png)

Node.js performs slightly better on Ubuntu than it does on Windows. Given that Node.js uses Google’s Chrome JavaScript engine, we would expect similar performances across platforms.
 
Dotnet Core in this instance though is about three times slower on Linux than it is on Windows. This makes sense since Microsoft is the creator of Windows 10 and will have tons of expertise on optimizing application for the operating system.
 
## Two takeaways from this Pi Day exercise ##
1. .NET core performance is very impressive. The release of Node.js brought Async processing to the forefront to enable performant API calls. The rest of vendors have been playing catch up, and Microsoft’s catch up with .NET Core is very fast. This is also backed up by much more thorough benchmarks from TechEmpower.

2. Second, the development landscape is vastly different in the five years since we did a Pi day look at C# and C++ performance in 2013.

Microsoft’s C# classic is not the company’s future direction. They are 100% in on the new .NET Core platform and enabling developers to build things on Windows, Mac or Linux. This is a remarkable turnaround for a company that once called Linux a [cancer](https://www.theregister.co.uk/2001/06/02/ballmer_linux_is_a_cancer/).
 
Throw in the fact that .NET Core is an Open Source technology, as is Node.js. Microsoft has even Open Source .NET classic. We can see that in the five years since we last looked at performance that Open Source technology has become the standard for developers, with implementations on the developer’s platform of choice. That is outstanding progress for developers.
 
Happy Pi day! Go and write some code!

This blog post originally appeared
at [Skyline Technologies](https://www.skylinetechnologies.com/Blog/Skyline-Blog/March_2018/pi-day-compare-dotnet-core-classic-node-javascript)