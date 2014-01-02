---
layout: post
title: Create Interactive User Experiences Quickly and Easily with Silverlight Pivot Viewer
date: 2011-04-25
tags: ["Appleton Compassion","Giveology","Pivot Viewer","Silverlight","Skyline Technologies","Web"]
---

The Appleton Compassion Project, a recent charity project Skyline has completed, takes advantage of a great tool in the Microsoft toolset that few people know is out there, the Silverlight Pivot Viewer. Unfortunately, Microsoft has quite a few things named Pivot so you may find this confusing. Pivot Viewer is NOT:

*   PowerPivot- This is an Excel tool that allows you to manipulate A LOT of data
*   Excel Pivot - This is your day to day Excel pivot
The Silverlight Pivot Viewer IS a tool that allow developers to quickly create an engaging and interactive data driven experience. To get an idea of what I'm talking about, check out the [Appleton Compassion Project Virtual Exhibit](http://www.appletoncompassion.org/VirtualExhibitViewer).

This online exhibit contains over 10,000 pieces of art done by students at dozens of different schools. You can see how site visitors can quickly click a school or a grade and narrow down the art that is displayed. Clicking an image will show the student's compassion statement and other demographic information without having to write any special code.

So it looks nice, but how do we create something this interactive? The great part is it's really not too difficult!

The first thing that needs to be done is create a Deep Zoom file, [which I cover in another blog post](http://www.skylinetechnologies.com/blog/Pages/deepzoom.aspx), that will provide the images for the viewing experience. An XML file, with the extension of CXML is created and that is the file the Silverlight Pivot Viewer consumes. The important thing to realize is there is NO User Interface code to write. To reiterate... ZERO user interface development is needed. You create the Deep Zoom file, create the CXML file, add the Pivot Viewer control to your Silverlight XAML and you have a HIGHLY interactive user experience.

The CXML file has four parts to it. The first is a node called Collection, it is the top level node for the XML file.

Second is a node called Facets. The facets are the categories that are displayed on the left of the screen. In the example above, School, Grade, Art Teacher and Teacher are all facets. The facets are then searchable within the Pivot Viewer. Visitors can type in a school name or use the check box to filter down the data.

Third is a node for all of the Items. For the Appleton Compassion Project, the items are all the artists who created art work and accompanying compassion statements.

The last node is the item node, which is the data that is used to populate the Pivot Viewer. The item node has data for each of the defined facets to populate the search experience on the left of the screen. For our example, a given artist would have a School Name, which are then automatically queried to create the list on the example.

Here's an example of how the XML would look:
<pre class="brush:xml;"><?xml version="1.0" encoding="utf-16"?>

<Collection xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" Name="Appleton School Compassion Project" SchemaVersion="1.0" xmlns:p="http://schemas.microsoft.com/livelabs/pivot/collection/2009" xmlns="http://schemas.microsoft.com/collection/metadata/2009">

<FacetCategories>

<FacetCategory Name="School" Type="String" p:IsWordWheelVisible="true" p:IsMetaDataVisible="true" p:IsFilterVisible="true" />

<FacetCategory Name="Grade" Type="String" p:IsWordWheelVisible="true" p:IsMetaDataVisible="true" p:IsFilterVisible="true" />

<FacetCategory Name="Art Teacher" Type="String" p:IsWordWheelVisible="true" p:IsMetaDataVisible="true" p:IsFilterVisible="true" />

<FacetCategory Name="Teacher" Type="String" p:IsWordWheelVisible="true" p:IsMetaDataVisible="true" p:IsFilterVisible="true" />

<FacetCategory Name="Picture Number" Type="String" p:IsWordWheelVisible="true" p:IsMetaDataVisible="false" p:IsFilterVisible="false" />

<FacetCategory Name="Tile Location" Type="String" p:IsWordWheelVisible="false" p:IsMetaDataVisible="true" p:IsFilterVisible="false" />

</FacetCategories>

<Items ImgBase="collection-2521020991055083062.dzc">

<Item Img="#301" Id="3803" Href="http://www.appletoncompassion.org/Artist/3803" Name="Henry Ptacek">

<Description>Artist statement not yet available</Description>

<Facets>

<Facet Name="Picture Number"><String Value="3803" /></Facet>

<Facet Name="School"><String Value="Franklin Elementary School" /></Facet>

<Facet Name="Grade"><String Value="4" /></Facet>

<Facet Name="Art Teacher"><String Value="Sara Wilda" /></Facet>

<Facet Name="Teacher"><String Value="Louann Graf" /></Facet>

</Facets>

</Item>

</Items>

</Collection></pre>
As you can see, it's relatively straight forward XML. There are many things I have not talked about, like the ability to have different types of data, sliders for your data, etc. Check out the links for more information.

**Why Use it?
**The Silverlight Pivot viewer is a great data driven UI experience for end users. The creation process involves creating a Deep Zoom file and some Xml.

**I want to learn more!
**[Microsoft's Silverlight Pivot viewer site ](http://www.silverlight.net/learn/pivotviewer/)

[Silverlight Pivot XML Schema information ](http://www.silverlight.net/learn/pivotviewer/collection-xml-schema/)

To Develop with the Silverlight Pivot viewer, you will need the Silverlight 4 SDK as well as the Pivot Viewer Control, which you can [download here](http://www.silverlight.net/learn/pivotviewer/).

This post originally appeared at Skyline Technologies [Skyline Technologies](http://www.skylinetechnologies.com/)