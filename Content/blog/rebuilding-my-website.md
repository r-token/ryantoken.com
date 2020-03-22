---
date: 2020-03-22 11:02
title: Rebuilding My Website
description: Why I decided to rebuild ryantoken.com from the ground up, and how I did it with Swift (and without JavaScript)
tags: Swift, Publish, Web, ryantoken.com
---

<style type="text/css">
.resizable-image img {
    text-align: center;
    margin: auto;
    width: 100%;
    border-radius: 5px;
}
</style>

# Rebuilding My Website

*Why I decided to rebuild ryantoken.com from the ground up, and how I did it with Swift (and without JavaScript)*

<br />

## Humble Beginnings

The summer of 2015 was the summer between my sophomore and junior years at the University of Tulsa. I had taken a few programming classes by that point, and was drawn to web development. To prove to myself that I knew my way around the basics, I wanted to build a personal website – I didn't have a plan for it, but I knew that I wanted it.

Most recently, I had learned about a tool called [**Bootstrap**](https://getbootstrap.com/). Everyone and their mother raved about Bootstrap. In 2015, it sounded like the end-all be-all for responsive web design. Spoiler: it isn't. But I, a young and impressionable college student, Bootstrapped the ever-loving heck out of version one of my website.

See for yourself:

<br />

<div class="resizable-image">
    <img src="../../blog_images/websiteV1.JPG" alt="ryantoken.com v1"/>
</div>

<br /> <br />

You don't get much more Bootstrappy than that.

There are several items, just on that home page, that scream Bootstrap (and inexperience) if you know what you're looking for.

What screams Bootstrap? If you're familiar with it at all, you'll probably notice them immediately. The header, the Jumbotron (or Hero Unit, as Bootstrap now calls it), the three-column layout, and the footer.

All four of those items are classic, vanilla Bootstrap with very few modifications. Remember – in 2015 I was a bona-fide noob in the world of web development. I had no idea what I was doing. Bootstrap was awesome, and in some ways still is. It solved a lot of problems for a fledgling web developer. Also, apparently CSS gradients were the greatest things I'd ever seen, as I threw different variations of them wherever I could fit them.

But hey, this was the first website I had built completely on my own. I had no input from a boss, teachers, or fellow students. I was, and still am, proud that I built it. I learned a lot that I wouldn't have learned otherwise, it helped solidify my love of web development, and when all was said and done, there was a product out there that the world could see.

<br />

## Iterations

So that was 2015. Until this complete rebuild in March of 2020, it stayed *more or less* the same for the next several years. It did go through a couple of design refreshes over that time, though.

Notably:

<br />

<div class="resizable-image">
    <img src="../../blog_images/websiteV2.JPG" alt="ryantoken.com v2"/>
</div>

<br /> <br />

And then:

<br />

<div class="resizable-image">
    <img src="../../blog_images/websiteV3.png" alt="ryantoken.com v3"/>
</div>

<br /> <br />

In the first of those two design refreshes, I got my feet wet with transparency, and added some dynamic functionality to the footer that let you navigate the website page-by-page from there.

The second is how the website looked the day before I published the rebuild you're reading this on now.

I finally got rid of those blue-teal gradient boxes, left the three-column layout behind, added some dimensionality and pictures, and significantly simplified the codebase.

However, after five years, it was time for a complete re-think of my website. The previous site felt stale and I didn't enjoy working on it or adding to it as much anymore. More than anything, though, was the fact that I'm out of college now.

The previous site was very much focused on me, my resume, and my portfolio of projects. I no longer felt that I needed as much of a 'resume' site. My mindset has shifted dramatically since then, and so my website needed to shift dramatically along with it.

<br />

## Options for the Rewrite

I knew I wanted to completely recreate the website with modern developer tools and a system that would be easy and fun to iterate on. I did not know, however, what exactly I'd be using to kick this off. To help narrow those options down, I listed out some goals for the site:

<div>
<ul style="margin-left: 25px">

    <li> First and foremost – it needed a blogging component </li>
    
    <li> It should be fun for me to work on and add to, instead of feeling like a chore </li>
    
    <li> It should be built with a modern language and toolset </li>
    
    <li> It should not look like every other personal website out there </li>
    
</ul>
</div>

<br />

I've added several new skills to my personal toolbox since 2015, my favorites of which are [React](https://reactjs.org/) and [Swift](https://developer.apple.com/swift/). I use React for most of my web projects, and Swift and [SwiftUI](https://developer.apple.com/xcode/swiftui/) for native iOS projects.

I run a podcast and blog covering University of Tulsa athletics on the side, and as part of that I built [our website](https://thegoldenhurricast.com) with React. This was my first React project, and you might see some similarities to the screenshots above. That's because, more for comfort than anything, I used [React Bootstrap](https://react-bootstrap.github.io/) to create the front-end. It's basically Bootstrap rebuilt for use in a React environment. It was easy to pick up due to my familiarity with Bootstrap, and I liked it, but I've since been using [Material-UI](https://material-ui.com/) for React projects.

I wrote a [blogging engine](https://thegoldenhurricast.com/blog) with React as part of that project, and my first inclination was to reuse the skills I had picked up from that. I would've used Material-UI instead of React Bootstrap for the front-end design, but I could have reused a lot of the rest. That would have been the easier way for me, and I strongly considered that option.

Contrarily, I've been pretty deep into iOS development since 2017. I taught myself Swift, released my [first iOS app](https://apps.apple.com/us/app/catchup-keep-in-touch/id1358023550) in May of 2018, and have several more that I've worked on locally but haven't released. Let me be clear, I *really* enjoy writing code with Swift. The type-safety, readability, community, and plenty more made it incredibly fun to learn.

I've long wanted to build a website with Swift, but was never fully satisfied with the available tools. I've toyed around with server-side Swift frameworks like [Vapor](https://vapor.codes/) and [Kitura](https://www.kitura.io/), but found both to be capable but overly-complicated solutions for what I wanted.

And then I found [Publish](https://github.com/JohnSundell/Publish). Publish is an open-source "static site generator for Swift developers" built by [John Sundell](https://twitter.com/johnsundell) – a former lead iOS developer at Spotify who now runs his own company called [Swift by Sundell](https://swiftbysundell.com) that is, naturally, all about Swift development. Publish was open-sourced in December of 2019, and all of Swift by Sundell is built with Publish.

## A Full Redesign, Built with Swift

I cloned Publish from GitHub to familiarized myself with it for a few days, and was hooked. I decided that this was the best (and most fun) answer.

Publish was exactly what I was looking for. It lets you build and configure your **entire website** with Swift and Markdown, nearly everything is customizable, and it comes with native support for blogging built in. It also supports custom themes, plugins, and a host of other powerful options.

There is <u>zero JavaScript</u> throughout the entire site. 

The main Swift file to build a site with Publish is incredibly simple to understand. Here's what mine first looked like:

<br />

<div class="resizable-image">
    <img src="../../blog_images/publish-basic.png" alt="main.Swift file in Publish"/>
</div>

<br />

First, there's an enum called SectionID. This is where you describe what sections your website will have. Mine are the four main tabs at the top of the page: [Blog](https://ryantoken.com/blog), [Projects](https://ryantoken.com/projects), [Meta](https://ryantoken.com/meta), and [About](https://ryantoken.com/about).

Next, there's a struct called ItemMetadata. This is site-specific metadata which we’ll be able to use in a fully type-safe manner all throughout our publishing process. I don't have anything in there at this point because, honestly, I don't know what benefit it would give a site as simple as mine.

And finally, there are five variables set that finalize some information for the website. The last step is the 'try' statement that actually calls on Publish to generate the HTML and CSS files that your browser will serve up to show you this page.

It's really an incredibly simple layout.

This blog post, and every one that will come after it, are simple [Markdown](https://daringfireball.net/projects/markdown/) files that the Swift package can reference.

## Next Steps

When this post comes out, I will still be using Publish's built-in theme for the site. However, Publish uses another framework (also built by John Sundell) called Plot that allows for custom themes to be built and used by Publish.

My next goal for this site is to create my own theme and really customize a lot of it. Step one was just to get it the new site out the door.

I'm incredibly excited for the journey that this site will lead me down. I've been dying to use Swift for something outside of strictly  development, and have also badly wanted to create my own blog. Publish satisfies both of those needs while allowing for as little or as much customization as I'd want or need.

I plan to dive head-first into Plot (his theming engine) in the very near future to add some more color, dynamism, and customization to the site. Keep an eye out for changes in that area soon.

In the meantime, I'll probably be writing about my experience with React while buildling [thegoldenhurricast.com] in the next month or so. After that, I will absolutely have a post or two once 2020 WWDC kicks off in an [online-only](https://www.apple.com/newsroom/2020/03/apples-wwdc-2020-kicks-off-in-june-with-an-all-new-online-format/) format in June.

Stay tuned! I can't wait to see how this goes.
