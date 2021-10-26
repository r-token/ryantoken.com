---
date: 2021-01-27 22:44
description: The projects I'm currently working on.
title: Projects
---

<head>
	<meta name="apple-itunes-app" content="app-id=1358023550"/>
</head>

<style type="text/css">
.resizable-image {
    text-align: center;
    margin: auto;
    width: 100%;
    border-radius: 5px;
    display: flex;
}

.resizable-icon img {
    text-align: center;
    margin: auto;
    width: 30%;
    border-radius: 20px;
}
</style>

<h3> Projects </h3>

*What I'm currently working on in my spare time. You can support my work on <a href="https://patreon.com/ryantoken" target="_blank">Patreon</a> or <a href="https://www.buymeacoffee.com/ryantoken" target="_blank">Buy Me a Coffee</a>.*

<br />

---

<br/>

## Outrank

<div class="resizable-icon">
    <a href="https://apps.apple.com/us/app/outrank/id1588983785" target="_blank"><img src="../../blog_images/introducing-outrank/outrank-icon.jpeg" alt="Outrank's Icon"/></a>
</div>

<p>
Outrank is an app to help you check how your favorite FBS college football teams stack up against the rest. 
</p>

Available on iOS, iPadOS, and macOS (on M1 Macs), it tracks forty-seven different stats for all 130 Divison One FBS teams and lets you dissect and compare them however you'd like. You can even compare two teams side-by-side to preview an intriguing matchup.

<br />

<div class=resizable-image>
<a href="https://apps.apple.com/us/app/outrank/id1588983785" target="_blank"><img src="../../blog_images/introducing-outrank/outrank-rankings.png" alt="Outrank's Rankings page"/></a>
<a href="https://apps.apple.com/us/app/outrank/id1588983785" target="_blank"><img src="../../blog_images/introducing-outrank/outrank-detail.png" alt="Outrank's Detail page"/></a>
<a href="https://apps.apple.com/us/app/outrank/id1588983785" target="_blank"><img src="../../blog_images/introducing-outrank/outrank-compare.png" alt="Outrank's Compare page"/></a>
<a href="https://apps.apple.com/us/app/outrank/id1588983785" target="_blank"><img src="../../blog_images/introducing-outrank/outrank-settings.png" alt="Outrank's Settings page"/></a>
</div>

The Outrank app is built with 100% <a href="https://developer.apple.com/xcode/swiftui/" target="_blank">SwiftUI</a>.

On the back-end, it leverages <a href="https://developer.apple.com/icloud/cloudkit/" target="_blank">CloudKit</a> as well as various AWS services including <a href="https://aws.amazon.com/dynamodb/" target="_blank">DynamoDB</a>, <a href="https://aws.amazon.com/api-gateway/" target="_blank">API Gateway</a>, and <a href="https://aws.amazon.com/lambda/" target="_blank">Lambda</a>.

You can follow <a href="https://twitter.com/OutrankApp" target="_blank">Outrank on Twitter</a>, and you can read my blog post about building Outrank <a href="https://ryantoken.com/blog/introducing-outrank" target="_blank">here</a>.

<br />

<a href="https://apps.apple.com/us/app/outrank/id1588983785" target="_blank" style="display:inline-block;overflow:hidden;background:url(https://linkmaker.itunes.apple.com/assets/shared/badges/en-us/appstore-lrg.svg) no-repeat;width:270px;height:80px;background-size:contain;"></a>

<br /> <br /> <br /> <br />

---

<br/>

## Eagle Crest STL

<p>
<a href="https://eaglecreststl.org" target="_blank">Eagle Crest STL</a> is a fully serverless web app tailor-made for the Eagle Crest HOA in St. Louis, MO.
</p>

It allows members and trustees to easily send messages, make requests, give announcements, view documents, and see a list of all homeowners in the HOA.

<div>
<a href="https://eaglecreststl.org" target="_blank"><img src="../project_images/eaglecrest-home.PNG" alt="Eagle Crest STL" style="border-radius: 5px; width: 100%;"/></a>
</div>

It's a Jamstack app built with <a href="https://reactjs.org" target="_blank">React</a> on the front end, <a href="https://aws.amazon.com/" target="_blank">AWS</a> as the middle tier and the back end, and is hosted on <a href="https://www.netlify.com/" target="_blank">Netlify</a>.

AWS services used for this include S3, Lambda, API Gateway, DynamoDB, SES, Cognito, Amplify, and more.

<br /> 

---

<br />

## Dashing Through the 'Ville

<style type="text/css">
.resizable-image img {
	text-align: center;
	margin: auto;
	width: 100%;
}
</style>

<p>
<a href="https://dashingthroughtheville.com" target="_blank">Dashing Through the 'Ville</a> is a city-wide scavenger hunt held throughout Bartlesville, Oklahoma.
</p>

Proceeds from the event benefitted Youth and Family Services of Washington County, and it helped them raise a total of $15,000.

The web app is fully serverless – built with <a href="https://reactjs.org" target="_blank">React</a> on the front end, <a href="https://aws.amazon.com/" target="_blank">AWS</a> as the middle tier and back end, and hosted on <a href="https://www.netlify.com/" target="_blank">Netlify</a>. The AWS services used include Lambda, API Gateway, DynamoDB, SES, Cognito, Amplify, IAM, and more.

<div>
<a href="https://dashingthroughtheville.com" target="_blank"><img src="../project_images/dttv-website.png" alt="Dashing Through the Ville" style="border-radius: 5px; width: 100%;"/></a>
</div>

I was the sole developer for this project. As a volunteer, I ended up building the entire application in a span of three weeks.

We had about three hundred users throughout the city, and heard of no incidents throughout the event.

<br /> <br />

---

<br /> <br />

## CatchUp - Keep in Touch

<div class="resizable-icon">
    <img src="../../about_images/catchup-icon.png" alt="CatchUp's App Icon"/>
</div>

**Featured on Brett Terpstra's <a href="https://esn.fm/systematic/218" target="_blank">Systematic</a> Podcast as one of his 'Top 3' (around 46:21)*

My first public-facing iOS app! First released in May of 2018, I completely rewrote it in May of 2020 using <a href="https://developer.apple.com/xcode/swiftui/" target="_blank">SwiftUI</a>, <a href="https://developer.apple.com/documentation/coredata" target="_blank">Core Data</a>, and several other improvements.

<br />

<style type="text/css">
.small-resizable-image img {
    text-align: center;
    margin: auto;
    width: 21%;
    border-radius: 10px;
}
</style>

<div>
<a class="small-resizable-image" href="https://apps.apple.com/us/app/catchup-keep-in-touch/id1358023550" target="_blank"><img src="../project_images/catchup-home.png" alt="CatchUp - Home" style="margin-right: 10px;"/></a>

<a class="small-resizable-image" href="https://apps.apple.com/us/app/catchup-keep-in-touch/id1358023550" target="_blank"><img src="../project_images/catchup-details.png" alt="CatchUp - Details" style="margin-right: 10px;"/></a>

<a class="small-resizable-image" href="https://apps.apple.com/us/app/catchup-keep-in-touch/id1358023550" target="_blank"><img src="../project_images/catchup-preference.png" alt="CatchUp - Preference" style="margin-right: 10px;"/></a>

<a class="small-resizable-image" href="https://apps.apple.com/us/app/catchup-keep-in-touch/id1358023550" target="_blank"><img src="../project_images/catchup-tipjar.png" alt="CatchUp - Tip Jar"/></a>
</div>

<br />

CatchUp helps you stay in touch with the people who matter most. You can set reminders for the contacts you choose, and get notified when it's time to CatchUp with them again.

CatchUp is free with no ads, but has a tip jar if you want to buy me a coffee ☕

Read my blog post about modernizing CatchUp <a href="https://ryantoken.com/blog/catching-up" target="_blank">here</a>.

<br />

<a href="https://itunes.apple.com/us/app/catchup-keep-in-touch/id1358023550" target="_blank" style="display:inline-block;overflow:hidden;background:url(https://linkmaker.itunes.apple.com/assets/shared/badges/en-us/appstore-lrg.svg) no-repeat;width:270px;height:80px;background-size:contain;"></a>

<br /> <br /> <br /> <br />

---

<br /> <br />

## The Golden Hurricast

<style type="text/css">
.resizable-image img {
    text-align: center;
    margin: auto;
    width: 100%;
}
</style>

<p>
<a href="https://thegoldenhurricast.com" target="_blank">The Golden Hurricast</a> is the leading independent podcast and blog covering Golden Hurricane athletics at The University of Tulsa.
</p>

The website was built with <a href="https://reactjs.org" target="_blank">React</a>, <a href="https://graphql.org" target="_blank">GraphQL</a>, and <a href="https://www.gatsbyjs.org" target="_blank">Gatsby</a>.

<div>
<a href="https://thegoldenhurricast.com" target="_blank"><img src="../project_images/tgh-website.png" alt="The Golden Hurricast" style="border-radius: 5px; width: 100%;"/></a>
</div>

I built and maintain the website, as well as co-host the podcast and contribute to blog posts. All of the content produced by The Golden Hurricast is completely free.
