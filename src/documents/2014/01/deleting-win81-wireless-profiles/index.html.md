---
layout: post
title: Deleting Windows 8.1 Wireless Profiles
date: 2014-01-08
tags: ["PowerShell","Windows8"]

---

I have had some pretty strange behavior after upgrading to Windows 8.1. With Windows 8, Microsoft syncs up your wireless
profiles to the cloud so when you have a new device, the wireless is already setup. So that is pretty cool. However, I
have been having issues with it.

For our home network, our SSID is not broadcast, like it should be on yours :). We manually add a hidden network and connect that way. With
Windows 8.1, I would not be able to connect sometimes. I would then type in the name of our (hidden) SSID and the associated Password.
It would then connect to the WiFi router, but the problem was it would create a new network profile each time. The way
Windows 8 appears to build the name is by adding the number for the new wirless profile by checking the cloud or synched
wireless profile that it could not connecting and adding one up to it. For example, if my wireless network is called
Network Name, the second time I connected it would be, Network Name 2. The third time I connected it would be Network Name 2 3,
and then Network Name 2 3 4, etc. . I ended up
with VERY long strings for my network names. It also appears to add these to the cloud based profile no matter how often
I clean up.

Ultimately, I want to figure out how to clean up my wireless profiles that have been synched to the cloud. I don't really
need or want the wireless profile for the restaraunt where I had a work meeting and accidently remembered the network. In the interim
I have used PowerShell to enumerate all of the profiles and delete them, except the first one (aka Network Name).

One of the things I want to do is spend more time in the command line this year. Mostly, I want to not have to lookup
how to do things to interact with GitHub. So in that vain, I wrote a PowerShell script to delete all but the first
wireless profile I created.

So here is the PowerShell script


```PowerShell
$profile = "Network Name"
$total = 32
$count = 2
Start-Transcript
netsh wlan show profiles
do {
 $profile = $profile + " " +$count
 $execCommand = "netsh wlan delete profile name=""$profile"""
 Write-Host($execCommand)
 Invoke-Expression $execCommand
 $count++
}
while ($count -le $total)

```

Also, as part of more command line, I have created a small GitHub repository to save scripts I create. Mostly so
I can grab them when I am other machines. Feel free to have at em

* GitHub PowerShell Repository - https://github.com/jptacek/PowerShell
* RemoveWirelessProfile.ps1 script on Github - https://github.com/jptacek/PowerShell/tree/master/Network/Wireless

