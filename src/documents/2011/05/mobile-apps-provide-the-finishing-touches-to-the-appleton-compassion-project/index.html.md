---
layout: post
title: Mobile Apps Provide the "Finishing Touches" to the Appleton Compassion Project
date: 2011-05-11
tags: ["Appleton Compassion","Giveology","Mobile","Mobile","Web"]
---

The [Appleton Compassion Project](http://www.appletoncompassion.org/)is a community art project in which all Appleton Area School District students created a 6" x 6" tile depicting their idea of compassion. Each student then wrote a statement about their tile and what compassion means to them. The art and statements can be viewed in the Trout Museum of Art or online at www.appletoncompassion.org. Adding the writing element to the art project has produced some very well rounded, heartfelt depictions of the word "Compassion".

The artist statements range all over the board; from moving, to amusing, to first-grader-cute. It quickly became apparent that with the job of physically displaying over 10,000 pieces of Art on the walls of the Trout Museum of Art, that the compassion statements would not be available for display alongside the tiles. Since the writing element was just as important to the project as the art, we knew we needed to come up with a solution to allow museum visitors to read the statements. The answer? Smartphone apps! Skyline created applications for the three major platforms - Android, iPhone and Windows Phone 7 - that museum visitors can install on their mobile phones so they can view artist statements along with the art.

Since this is the first time that Skyline has created mobile apps for the three major mobile platforms, I thought I'd share how we approached the design of the applications, focusing on what was common between all three. Then, in future blog posts each of the mobile platforms will be discussed from a development standpoint.

In essence, the goal of the mobile application design, at a high level, focused on two things: One, consistency of functionality within three applications, and two, have the application behave like a native application on the individual mobile phones. Okay, what does this really mean? We sat down as a team and identified the functionality the application should have. For the mobile applications these were the features we wanted:

*   Highlight featured art upon entering the app
*   By clicking on an image users would be able to view the compassion statement
*   Search by student name
*   Search by picture number
*   Allow users to mark and keep a list of favorites
*   Have static text to highlight information about the museum, exhibit, hours, Skyline, etc.
Once a set of features was decided on, we focused on having those pieces display consistently within the applications, so that featured art was first, favorites was second, and so on. We also wanted to make sure that search was available on each screen across the application. Finally, we attempted to use consistency with the graphics across platforms wherever possible. All of the applications have the same splash screen (featuring Art by Skyline employees) and use the same logo where needed.

Each developer took these requirements and implemented them within the various mobile platforms so they were consistent for the users of that platform. For example, the iPhone and Windows Phone 7 have very different UI implementations. The iPhone has more of a button-driven menu interface, where the Windows Phone UI utilizes text and swiping as a function of their Metro UI. This results in the search button being at the bottom of the screen for the iPhone application and at the top for the Windows Phone application. Each application has the same functionality, just implemented differently - appropriate for the native platform.

The last part of the mobile applications is the data services that feed the application. Surprisingly enough, there are only two. The services are REST-based, with the data returned to the client in XML format.

The first service returns a random set of featured art ([http://www.appletoncompassion.org/rest/FeaturedStatements/12](http://www.appletoncompassion.org/rest/FeaturedStatements/12)). With REST, you can provide parameters in the URL, so in the instance the number tells you how many items to return. We have a single object type we used for both of the services to return, so in this instance there is some excess data in the XML stream that would not necessarily be needed, but it made development easier. This REST call is used to return the featured images that greet the user each time they start the application.

The second service is responsible for searching. Within the application, there are two types of search. The first one is by picture number, so if you are at the exhibit in the museum you can type in a number and see the artist statement that corresponds with the tile. The second is by name, so you can look up a specific child. We were able to implement this search functionality in a single service call, by having the back end service worry about if the search was a number only or if it had text. The service can search by number ([http://www.appletoncompassion.org/rest/search/7158](http://www.appletoncompassion.org/rest/search/7158)), last name ([http://www.appletoncompassion.org/rest/search/ptacek](http://www.appletoncompassion.org/rest/search/ptacek)) or full name ([http://www.appletoncompassion.org/rest/search/nora%20ptacek](http://www.appletoncompassion.org/rest/search/nora ptacek)).

It's a small example, but it illustrates the point of trying to encapsulate as much logic is possible in our service calls and not put the burden on the mobile phone. This way if there's a bug or change that needs to be made in the search functionality, we can update the service call, and not have to go through the lengthy process of updating three mobile applications in their respective mobile stores.

Watch for future blog posts that discuss each individual platform in more detail.

This blog post originally appeared at Skyline Technologies ([http://www.skylinetechnologies.com/blog/Pages/compassionmobileappdevelopment.aspx](http://www.skylinetechnologies.com/blog/Pages/compassionmobileappdevelopment.aspx))