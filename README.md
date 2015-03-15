MTransit
========

MTransit is an iOS 8 native version of [MezTransit](http://meztransit.herokuapp.com/), a single page web app built to gather and return some times for trains to and from a Philly neighborhood. The package now also includes a WatchKit version for Apple Watch.

![screenshot](https://github.com/kellyi/iOSMTransit/blob/master/image.png)      &&      ![watchscreenshot](https://github.com/kellyi/iOSMTransit/blob/master/mtransit_applewatch.png)

It's written in Objective-C, and it includes an MTFetchTrains class with extendable methods which can be modified to return SEPTA trains to and from other Philly neighborhoods using public APIs. MTFetchTrains.m includes instructions for modifying the classes.

The app functionality's completed (minus a check to ensure the iPhone has an internet connection or to return a proper error), but I'm done working on it so it's here under the [MIT License](https://github.com/kellyi/iOSMTransit/blob/master/LICENSE.md).
