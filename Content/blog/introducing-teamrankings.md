---
date: 2021-10-23 8:00
title: Introducing TeamRankings
description: Information about the new app, and my experience building it.
tags: iOS, Swift, SwiftUI
---

<style type="text/css">
.resizable-image img {
    text-align: center;
    margin: auto;
    width: 32%;
    border-radius: 5px;
}

.resizable-icon img {
    text-align: center;
    margin: auto;
    width: 30%;
    border-radius: 20px;
}
</style>


# Introducing TeamRankings

Today I'm excited to debut my first new iOS app in three years:

## TeamRankings

<br />

<div class="resizable-icon">
    <img src="../../blog_images/introducing-teamrankings/teamrankings-icon.jpeg" alt="TeamRankings App Icon"/>
</div>

<br />

If you're a fan of American college football, this app is for you. TeamRankings is the easiest way to check how your favorite teams stack up against the rest. It shows you where your team ranks in forty-seven different tracked statistics compared to the other 129 FBS teams.

<br />

<div class="resizable-image">
    <img src="../../blog_images/introducing-teamrankings/teamrankings-rankings.png" alt="TeamRankings' Rankings page"/>
    <img src="../../blog_images/introducing-teamrankings/teamrankings-detail.png" alt="TeamRankings' Detail page"/>
    <img src="../../blog_images/introducing-teamrankings/teamrankings-compare.png" alt="TeamRankings' Compare page"/>
</div>

*screenshots courtesy of Federico Viticci and his wonderful [Apple Frames](https://www.macstories.net/ios/apple-frames-2-0-faster-lighter-and-featuring-support-for-iphone-13-ipad-mini-ipad-10-2-imac-24-macbook-air-and-multiple-languages/) shortcut*

<br />

Ever wonder where your team ranks in total offense, team sacks, turnover margin, and red zone defense? This is all simply glanceable information for each team instead of needing to hunt for each stat individually.

Want to preview the most intriguing matchups of the week? There's a feature for that, too. From the Compare tab, you can select any two teams and see how they compare with a convenient side-by-side view.

Other features include: 

* Widgets to show a team's top four and bottom four stats
* The ability to set your favorite teams
* A UI that's flexible enough to extend to iPadOS and macOS apps (for M1 MacBooks)
* Tip jar and subscription options

I built TeamRankings because I needed it. I host a college football podcast and wanted a quick way to find where my favorite teams stacked up, but couldn't find a service that provided it without a lot of pain in the process.

The app is free with no ads. It makes me no money by default. If you enjoy TeamRankings, I'd love it if you left a tip or subscribed in the app, or supported the app on Patreon.

Thank you for your interest in TeamRankings. If you have a feature request or feedback, please send an email to teamrankingsapp@gmail.com.

I'll end the main post here, but there are extra details on the app and my experience building it further down for anyone interested.

# Download Link/App Store Icon

<br /> <br /> <br />

# Some Notes

Hello! If you're still reading this, thank you! I had a blast building TeamRankings. I thought I'd go a bit deeper and share my experience building the app, things I learned, the technologies involved, and more.

<br />

## SwiftUI

First, a comment on SwiftUI. I used SwiftUI heavily to build this. In fact, 100% of TeamRankings is written with it - there is no bridging into UIKit for anything, and there's no Objective-C code either. It's all Swift and SwiftUI, just as the good lord intended.

When I rewrote my first app ([CatchUp](https://apps.apple.com/us/app/catchup-keep-in-touch/id1358023550)) with SwiftUI last year, there were *a lot* of issues. I detailed some of them in [this post](https://www.ryantoken.com/blog/catching-up/). Long story short, both of the big SwiftUI bugs I ran into with CatchUp have been resolved! This is **not** to say that SwiftUI is now flawless. It absolutely has problems, and debugging those problems can sometimes be baffling, but the entire SwiftUI development experience has improved so much since last year. I was astounded.

<br />

## Development Efficiency

This brings me to my second point: development speed and efficiency.

`File > New > Project` for this app happened on October 2nd. Three weeks later, the app is done and out in the world. And I should note that I have a normal full-time job doing full-stack web development. All development time for this was either mornings before work, evenings after work, or weekends.

There are a few different reasons I was able to ship this so quickly.

First, on June 29th, 2021, I began Paul Hudson's [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) course. On October 7th, exactly 100 days later, I finished it. I began working on TeamRankings on Day 95.

I simply cannot express how much working through this course helped me. I had started it twice before over the years, but burnt out around Day 40 both times. This time, due to a combination of support from my partner and posting daily in the [Hacking with Swift Slack Channel](https://hackingwithswift.slack.com/join/shared_invite/zt-rgfapib5-hQut2NVKwv6RwQ64VbYvtQ#/shared-invite/email) as Paul recommends, I was able to stay locked in and complete the course.

This was undoubtedly the most significant contributor to the development speed I mentioned. Working with Swift effectively every day for 100 straight days, and taking all of that knowledge and practice directly into a new app, paid off immensely. Being familiar with the latest SwiftUI techniques and having it all fresh in my head made all the difference in the world.

The second most important contributor to development speed was simply SwiftUI's power and convenience. This wound up being the perfect app for SwiftUI. TeamRankings uses a lot of `List`s, the UI doesn't try and get too "custom", and there was no need to bridge into UIKit for anything. That last part made things particularly clean. I've written a UIKit app before, and I'm comfortable bridging into it when necessary (see [CatchUp](https://apps.apple.com/us/app/catchup-keep-in-touch/id1358023550) and its contact picker), but *not* needing to build those bridges makes things so much smoother.

SwiftUI gives you so many features for free. Dark mode support, solid accessibility features out of the box, simple animations, the ability to jettison storyboards into the ether, flexible layouts between iOS, iPadOS, and macOS - all of this comes built in with no changes required. Of course, to take full advantage of these features you can (and should) go deeper than what SwiftUI provides by default, but it's impressive how much you get just by opting into the SwiftUI lifestyle.

<br />

## Other Technologies

To close things out, a quick note on some of the other core technologies involved with the app.

The back-end infrastructure is all AWS-based. I have a `node.js` server that handles a lot of the rankings data collection. That server throws its data into a couple different `DynamoDB` tables, and the app calls various `API Gateway` endpoints that trigger `Lambda` functions to query those DB tables. The results of those API calls return JSON that I decode into Swift structs which finally winds up inside a SwiftUI `List` in the UI. All of the AWS infrastructure is generated via [IaC](https://en.wikipedia.org/wiki/Infrastructure_as_code) with the [Serverless Framework](https://www.serverless.com/framework).

There is no web front-end for this yet, but that is one of my goals for the app. I've been [big into Jamstack](https://www.ryantoken.com/blog/rocking-with-the-jamstack/) web development lately, and have recently been experimenting with the [Nuxt 3 beta](https://v3.nuxtjs.org/). My background with front-end web development is in [React](https://reactjs.org/), but the plan is to build the web front-end for TeamRankings with Nuxt 3 once it's out in production.

<br />

## A Quick Note on Privacy

I collect/store *none* of your data. Literally 0. I have no interest in any of it, so let's put that to bed right now.

<br />

## Signing Off

That covers all of the big pieces I wanted to get to about this app. I have legitimately had a very fun time building this, and (95% of the time) SwiftUI continues to be a true joy to work with.

Thank you for reading. If you have questions, comments, feedback, feature requests, or anything else about the app, please [email me](mailto:teamrankingsapp@gmail.com).

<br />

**<a href="#">Back to Top</a>**
