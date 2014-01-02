---
layout: post
title: Developing with Microsoft's Azure Platform
date: 2011-03-25
tags: ["Appleton Compassion","Azure","Giveology","Web"]
---

For the past several months, Skyline has been working on an awesome charity project called the [Appleton Compassion Project](http://www.appletoncompassion.org/). This project will provide visitors to the [Trout Museum of Art ](http://www.troutmuseum.org/)a way to view the 10,500 pieces in the exhibit and their accompanying artist statements. It has also provided us with an excellent opportunity to develop in Azure and learn a thing or two which I'm going to share with you.

The Appleton Compassion Project is hosted on Microsoft Azure. Azure is Microsoft's platform for developing cloud applications based on its Microsoft .NET technology. The good news is that if you're a programmer doing .NET development you are already well positioned to do Azure programming!

The cloud means a lot of different things to a lot of different people, but in discussing Azure, we can think of it as providing several features.

First, it provides infrastructure. For the Appleton Compassion Project, this was important. The goals of the project were such that they were (and still are) hoping to have some big-name celebrities involved, which could result in a large number of visitors to the site. While we could plan for that kind of demand, the Appleton Area School District - who is sponsoring the project - could not afford the hardware to meet it. Since one of the features of Azure is the ease of scalability, it can quickly meet the demands by adding more compute instances (the virtual machines that Azure uses). This is an example of where we pay for what we use, and don't have to pay for demand that we plan for, that may or may not be used.

Second, it provides scale. This is a necessity as the Virtual Exhibit on the site will contain over 10,000 individual images that need to be displayed. The process we have to create the Pivot collection for our current batch of 8,000 images creates over 750,000 Deep Zoom files, is computationally intense, and literally takes days to run. We can greatly reduce this time by paying more and using larger computer sizes and creating multiple tasks in parallel. Once the files are created, we can then reduce the computer size to serve up HTML pages until we need the increase in computing power. Doing this kind of implementation using computing hardware as needed on the school district's hardware would not be cost effective.

Another variation of scale is disk space ... we only pay for what we use. We don't need to be concerned with checking for disk space before we run our collection creation process, estimating the amount of files we will create and ensuring we have enough. Azure will automatically grow and make redundant copies of our data, so that if the server goes down, the data is stored elsewhere.

As I mentioned earlier, Azure is based on .NET technologies, making it relatively straightforward to move to cloud development. There are, of course, several differences. When you deploy an application to Azure, it starts a dedicated Virtual Machine to host your application in a Microsoft data center. The bigger the size of the machine you request, the more you pay. One result of the virtual machine being created for each deploy is that you don't want to persist data to these VMs. You will use blob storage for persisted data. This is one of the biggest differences between Azure and normal .NET development.

This blog post originally appeared at Skyline Technologies ([http://www.skylinetechnologies.com/blog/Pages/developingwithazure.aspx](http://www.skylinetechnologies.com/blog/Pages/developingwithazure.aspx))