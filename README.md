ProcessScheduler
================
A Goonstation release, maintained by Volundr

##SUMMARY

This is a mostly self-contained, fairly well-documented implementation of the main loop process architecture in use in Goonstation.

This code is released under the AGPL.

##INSTALLATION

To install the test project, you will require:

- node.js
- BYOND

Clone the repository to a path of your choosing, then change directory to it and execute:

```
npm install -g
bower install -g
``` 

Then you can either compile with DM or open the DM environment in DreamMaker and compile/run from there.

##USAGE

###BASICS
To use this in your SS13 codebase, you'll need:

- process.dm
- processScheduler.dm
- processScheduler.js
- updateQueue.dm
- updateQueueWorker.dm
- _defines.dm
- _stubs.dm

To integrate, you can copy the contents of _defines.dm into your global defines file. Most ss13 codebases already have the code from _stubs.dm, except the bootstrap stuff. The bootstrap-specific interface code in processScheduler can easily be ripped out and replaced with other HTML.

###DETAILS

To implement a process, you have two options:

1. Implement a raw loop-style processor
2. Implement an updateQueue processor

There are clear examples of both of these paradigms in the code provided. Both styles are valid, but for processes that are just a loop calling an update proc on a bunch of objects, you should use the updateQueue.

The updateQueue works by spawn(0)'ing your specified update proc, but it only puts one instance in the scheduler at a time. Examine the code for more details. The overall effect of this is that it doesn't block, and it lets update loops work concurrently. It enables a much smoother user experience.

##Contributing

I welcome pull requests and issue reports, and will try to merge/fix them as I have time. 

