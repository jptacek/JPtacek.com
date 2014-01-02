---
layout: post
title: WebMatrix Proves an Excellent Tool for Creating Small Sites Quickly
date: 2011-06-06
tags: ["Appleton Compassion","Giveology","Skyline Technologies","Web","WebMatrix"]
---

As our work on the [Appleton Compassion Project](http://www.appletoncompassion.org/) was wrapping up, Skyline took over ownership of the database that runs the site from the School District so we could easily make corrections and additions without having to download a new version of the database each night. Now that we "owned" the database, we realized we needed a way to maintain and manage it. For this we used Microsoft's new tool, [WebMatrix](http://www.asp.net/WebMatrix).

Right about now you are asking yourself, really, another programming tool? An excellent question. WebMatrix is a response from Microsoft to Ruby on Rails and PHP. The benefit these development stacks is that they can generally be used to implement data driven sites relatively quickly and, until now, Microsoft didn't have a tool that allowed that.

While the .NET stack is a great development platform, it doesn't always allow for quick website development. As developers we tend to over-engineer sites, especially the ones that only need to be a couple of pages. We create a data layer, we create a business layer, and then we create a UI layer. These are, of course, industry best practices, but they are industry best practices for sites that are going to scale. If you're building a site for a couple of users who just want to see a list of their child's soccer games, this is definitely over engineering. WebMatrix is Microsoft's answer to that.

WebMatrix harkens back to the days of Classic ASP. It contains code logic in a single page, including the SQL statement. You can then render your page using Microsoft's new [Razor](http://www.computerworld.com/s/article/9178910/Microsoft_sharpening_Razor_view_engine_for_ASP.Net?source=rss_news)engine.

**Getting Started
**To get started, [download WebMatrix ](http://www.asp.net/webmatrix)using Microsoft's web platform installer. Upon starting up the application you'll see a nice, simple-to-use page that includes many templates you can use to get started with your development quickly and easily.

![](WebMatrixScreen.jpg)

So, what does the code look like? Truthfully, it's really simple. Here is the basis of a page we used to create a list of all students participating in the Compassion Project.

The first thing to realize is the @{ } syntax is part of the Razor view engine. It is the replacement for <%= %> that tells the runtime you are escaping out to do something code like. Essentially, to get our list of data we do three things ... open a database connection, tell it the SQL command, and execute the SQL statement, the same three things we always do. In this case however, those three things are three lines:
<pre class="brush:xml;">
@{
var db=Database.Open("Dev");
var sqlQuery = "select * from ProjectData order by LastName, FirstName";
var data = db.Query(sqlQuery);
}
</pre>
Next we have to render the output to the page. Again, we rely on the Razor View engine (look for the @ symbol):
<pre class="brush:xml;">
<body>
<ul>
@foreach (var row in data) {
<li><a href="EditArtist.cshtml?id=@row.PictureNumber">@row.PictureNumber</a> @row.LastName @row.FirstName</li>
}
</ul>
</body>
</pre>
We are essentially saying for each (@foreach is Razor syntax) row in our data set (data is a globally scoped variable on the page), create a link to a key (@ is again the Razor syntax, so @row.PictureNumber tells the page to use the picture number) and create hypertext for the person's name. That's it! As you can see from the code snippets above, it takes very few lines to get data from a database.

The update part is also similar. It is, of course, longer since there is a bit more logic, but notice how all of the syntax is on a single page:
<pre class="brush:xml;">
@{
var id = Request["ID"];
var sqlSelect = "select Id, PictureNumber, LastName, FirstName, Grade, HomeSchool, TileLocation,IsNull(DisplayStudentOnline,1) as DisplayStudentOnline,IsNull(FeaturedImage,0) as FeaturedImage,IsNull(FeaturedStatement,0) as FeaturedStatement,Description from ProjectData where PictureNumber=@0";
var db=Database.Open("Dev");
var sqlQuery = db.QuerySingle(sqlSelect,id);
var studentFirstName = sqlQuery.FirstName;
var studentLastName = sqlQuery.LastName;
var compassionStatement = sqlQuery.Description;
var homeSchool = sqlQuery.HomeSchool;
var tileLocation = sqlQuery.TileLocation;
var displayOnline = sqlQuery.DisplayStudentOnline;
var isFeaturedImage = sqlQuery.FeaturedImage;
var isFeaturedStatement = sqlQuery.FeaturedStatement;
var pictureID = sqlQuery.PictureNumber;
var imageUrl = "http://images.appletoncompassion.org/compassionimagesfull/thumb/" + @pictureID + ".jpg";
var isImageCheck = string.Empty;
if (isFeaturedImage) {
isImageCheck = "checked";
}
var isStatementCheck = "";
if (isFeaturedStatement) {
isStatementCheck = "checked";
}

var displayOnlineCheck = "";
if (displayOnline) {
displayOnlineCheck = "checked";
}

var ischeckedonpost = string.Empty;
if (IsPost) {
compassionStatement = Request["statement"];
tileLocation = Request["tileLoc"]
displayOnline = ParseCheckBox(Request["displayOnline"]);
isFeaturedImage = ParseCheckBox(Request["chkFeaturedImage"]);
isFeaturedStatement = ParseCheckBox(Request["chkFeaturedStatement"]);
var sqlUpdate = "Update ProjectData set description = @0, TileLocation=@1, DisplayStudentOnline=@2, FeaturedImage=@3,FeaturedStatement=@4 where pictureNumber=@5";
db.Execute(sqlUpdate,compassionStatement,tileLocation,displayOnline,isFeaturedImage,isFeaturedStatement,pictureID);
Response.Redirect("Page.cshtml");

}
}

@functions {
bool ParseCheckBox(string checkBoxValue) {
Response.Write("Value in: " + checkBoxValue +"</br>");
bool returnValue = false;
if (checkBoxValue == "on") {
returnValue = true;
}
else {
returnValue = false;
}
Response.Write("Value out: " + returnValue +"</br>");
return returnValue;
}
}
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8" />
<title>Edit Artist</title>
</head>
<body>
<a href="Page.cshtml">Home Page</a>
<form action="" method="post">
<p>Picture Number: @pictureID</p>
<p>First Name: @studentFirstName</p>
<p>Last Name: @studentLastName</p>
<p>Home School: @homeSchool</p>
<p>Tile Location: <input type="text" name="tileLoc" value="@tileLocation"/></p>
<p>Statement:</p><p> <textarea id="txtStatement" rows="10" columns="20" style="width:600px" name="statement">@compassionStatement</textarea></p>
<p>Display Student Online <input type="checkbox" name="displayOnline" @displayOnlineCheck/></p>
<p>Featured Art <input type="checkbox" name="chkFeaturedImage" @isImageCheck/></p>
<p>Featured Statement<input type="checkbox" name="chkFeaturedStatement" @isStatementCheck/></p>
<img src="@imageUrl"/>
<p><input type="submit" value="Save"/></p>
</form>
</body>
</html>
</pre>
**Why Use it?
**WebMatrix is Microsoft's response to tools such as Ruby and PHP that generally use inline SQL and allow developers to quickly get sites published. It includes many templates so you can get started quickly, and it will tie into Open Source projects such as Joomla.

**I want to learn more!
**[Official WebMatrix Site](http://www.asp.net/webmatrix)

WebMatrix Development 101

&nbsp;

[Web Matrix 101 book](http://www.amazon.com/Web-Development-using-WebMatrix-ebook/dp/B004I6D676/ref=sr_1_2?ie=UTF8&qid=1305890052&sr=8-2) - This is a nice little introduction and is only $1 for the Kindle.

This blog post orginally appeared at [ Skyline Technologies](http://www.skylinetechnologies.com/Blog/Lists/Posts/Post.aspx?ID=43)