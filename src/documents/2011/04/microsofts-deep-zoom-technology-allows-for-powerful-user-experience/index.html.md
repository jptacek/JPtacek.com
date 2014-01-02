---
layout: post
title: Microsoft's Deep Zoom Technology Allows for Powerful User Experience
date: 2011-04-25
tags: ["Appleton Compassion","Deep Zoom","Giveology","Silverlight","Web"]
---

Closely tied to the Silverlight Pivot Viewer I discussed in my [previous blog post](http://www.skylinetechnologies.com/blog/Pages/silverlightpivotviewer.aspx), is Microsoft's Deep Zoom technology. Deep Zoom enables users to pan and zoom around a high resolution image, or in the case of how we use it for the [Appleton Compassion Project Virtual Exhibit](http://www.appletoncompassion.org/VirtualExhibitViewer), navigate a large collection of images.

Deep Zoom accomplishes this by using a process similar to Google/Bing maps. There are layers to the image, so one layer can show the entire collection with very small sizes for the images. The images are also broken up into tiles, so as you go to higher resolution images, it may be broken up into several tiles so you do not have to load the entire image. As you zoom closer into the document, you are navigating to layers that are deeper and deeper in the collection, with increasing image resolution and will be loading a tile that is a subset of the image. Microsoft has a nice picture of this and an accompanying description at their [MSDN site](http://blogs.msdn.com/b/jaimer/archive/2008/03/31/a-deepzoom-primer-explained-and-coded.aspx).

Deep Zoom consists of several XML based files. The first is the Deep Zoom image (DZI). This file is essentially an XML file that contains the layers and tile information for a given image. The Deep Zoom image creation process creates a directory for each image, this directory will then have the layers, and images that are broken into tiles. For example, in testing that we did, a single image taken with a home digital camera that is 4 MB in size, was broken up into 12 sub folders, each containing tiled images. One image created 12 directories and 238 files. For the Appleton Compassion Project, the collection of 10,000+ art pieces has created nearly one million files!

The second deep zoom file type is the Deep Zoom Collection (DZC). This file essentially is the high level collection that points to the DZI files. The Silverlight Pivot viewer then references this DZC file for the zooming process.

There are two ways to create Deep Zoom files. The first is to use the Deep Zoom composer that is part of Expression Blend. This process, outlined in the link above, is manual which obviously won't work for 10,000 images. The interesting thing is Microsoft really doesn't have an SDK or install for creating the Deep Zoom files. You need to physical copy a DLL from the Deep Zoom Composer directory and make it part of your application, [outlined here](http://blogs.msdn.com/b/expression/archive/2008/11/26/hello-deepzoomtools-dll-deep-zoom-image-tile-generation-made-easy.aspx).

**Why Use it?
**Deep Zoom allows for a interactive zoom and pan user experience.

**I want to learn more!
**[MSDN Deep Zoom site ](http://msdn.microsoft.com/en-us/library/cc645050(VS.95).aspx)

Blog post on programmatically creating Deep Zoom

&nbsp;

[Jaime Rodrigues goes deep on Deep Zoom](http://blogs.msdn.com/b/jaimer/archive/2008/03/31/a-deepzoom-primer-explained-and-coded.aspx)

This post orgianlly appeared at Skyline Technologies ([http://www.skylinetechnologies.com/blog/Pages/deepzoom.aspx](http://www.skylinetechnologies.com/blog/Pages/deepzoom.aspx))