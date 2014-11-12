---
layout: post
title: Chocolately and BoxStarter
date: 2014-01-01
tags: ["Web"]

---

I recently received a new work computer (an [Asus i7](http://www.asus.com/Notebooks_Ultrabooks/ASUS_ZENBOOK_UX301LA/) that
weighs 2.6 pounds, my old laptop, a Dell M6500 weighed over 8.5 lbs, it is like I am from the future now, but I digress).
One of the things that I don't like about getting a new PC is setting up the computer. I am very good about making sure
all of my files are stored in the cloud (via Skydrive and DropBox) and/or is under source control. I don't fear losing stuff, it
is the loss time in restoring my applications and environments that makes me crazy. I always forget to install a utility
I want. Or the exact moment I NEED to remote desktop is when I remember I forgot to ENABLE remote desktop.

However, since my last PC install, the world of Windows has changed, and its name is [Chocolately](http://chocolatey.org/).
Chocolatey is similar to apt-get on Linux, or the NPM package manager for [Node](http://www.nodejs.org). You can, via
the command line, automatically install all kinds of applications that are available on [NuGet](http://www.nuget.org/).
For example, to install ReSharprer, fire up a command prompt and type

```bash
    cinst resharper
```
and away we go.

You can find out more at the [Chocolately](http://chocolatey.org/) site. Essentially though, you can achieve all of
this goodness by staring a command prompt and pasting the following

```bash
    @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin
```

So, [Chocolately](http://chocolatey.org/) solves problem the first, allowing for command line install of applications.
When paired with [Boxstarter](http://boxstarter.org/) however, it figures out problem the second of installing many different
applications that require reboots, etc, when you are setting up a new PC. BoxStarter handles reboots and logins
automatically for the user. You can type one command and be on your way!

[Boxstarter](http://boxstarter.org/) also enables me to setup a URL that will have all of the applications that I want
installed in a single location. For example, I created a Gist file on GitHub with all of the programs I want installed
when I have a PC.

```bash
    START http://boxstarter.org/package/nr/url?https://gist.github.com/jptacek/8099099/raw/f691b3433c09dcd361fca8cc6cfe637ca7521771/boxstarter
```

You can take a look at the file, but it is pretty basic.

I setup the Explorer options I want, for example, showing file extensions, and that provides me consistency across my
installs.

I then install the bevy of browsers that all web developers want at their disposal. This is followed by setups for Git,
NodeJS, Text Editor, coding utilities, etc. I even have installation for applications I use specifically at home, for
example, iTunes (I know, I vomit a little in my mouth each time I use it too).

Not only can you setup explorer options, but you can also setup your Windows environment! For example, I automatically
enable Remote Desktop, Setup HyperV and IIS on my development machines. I do this all from a single command and it
is awesome!

**Update**
A couple of people have run into issues if you are not using a default browser that does not support Click Once (for example
Google Chrome). Matt Wrock identifies the workaround in the comments below.


>It sounds like your default browser is not click-once enabled. Using START from the command line will invoke the url in your default browser. If that browser is IE or another browser that has a click-once extension, Boxstarter should be invoked. If Firefox or Chrome (or Opera or safari or anything not IE) is your default browser and you had no extension that is "click once" app aware, the behavior you describe sounds normal. Chrome is my default browser but I installed an extension from
> [https://code.google.com/p/clickonceforchrome/](https://code.google.com/p/clickonceforchrome/) that will allow it to work with click once apps like Boxstarter's web launcher.

Just to reiterate... You need to update your default browser to support click once. Links for

* Google - [https://code.google.com/p/clickonceforchrome/](https://code.google.com/p/clickonceforchrome/)
* FireFox - [https://addons.mozilla.org/en-us/firefox/addon/fxclickonce/](https://addons.mozilla.org/en-us/firefox/addon/fxclickonce/)
