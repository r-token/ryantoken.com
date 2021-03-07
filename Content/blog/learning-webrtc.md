---
date: 2021-03-07 7:00
title: Learning WebRTC
description: Explaining WebRTC concepts while reinforcing my own understanding.
tags: Web, WebRTC
---

#  Learning WebRTC
March 07, 2021

*Explaining WebRTC concepts while reinforcing my own understanding.*

<br />

---

<br />

<style type="text/css">
.resizable-image img {
    text-align: center;
    margin: auto;
    width: 100%;
    border-radius: 5px;
}
</style>

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-logo.png" alt="WebRTC logo"/>
</div>

<br />

WebRTC can be tricky to get wrap your mind around.

I've been working fairly heavily with the standard over the past several weeks, and wanted to document the knowledge I've gained while also demoing some sample code, examining the technology's pros and cons, and providing resources for continued learning.

<br />

## First, What is WebRTC?

[WebRTC](https://webrtc.org) stands for **Web** **R**eal-**T**ime **C**ommunication and enables "real-time communication for the web".

It has grown significantly since its initial implementation in 2011 as an open-source project by Google. Today, it's implemented as an open, standardized API that enables rich peer-to-peer communications, including audio, video, and generic data, for browsers, mobile devices, IOT devices, and more.

The most important thing WebRTC takes off of your plate is the challenge of finding the best peer-to-peer path to exchange audio and/or video in an efficient and low-latency manner.

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-overview.jpg" alt="WebRTC overview"/>
</div>

*WebRTC Overview*

<br />

## A Typical WebRTC Lifecycle

* Client *A* wants to connect to Client *B*

* *A* first needs to determine all possible ways that the public can connect to it (A)

* *B* then also needs to determine how the public can connect to it (B)

* *A* and *B* signal this session information (SDP) (more on this later) to each other **somehow**. This can be via a text, with a QR code, via HTTP, via WebSockets, or something else. The means by which you send this information doesn't matter.

* *A* then connects to *B* via the most optimal path (determined by ICE) (more on this later as well)

* *A* & *B* also exchange their supported media types and security information

* An agreement is made, and the connection is opened

<br />

## Necessary Concepts & Terminology

**NAT**: Network Address Translation

To truly understand WebRTC, you have to understand at least the basics of NAT. I'll try my best at a simple explanation of NAT and why it's necessary here.

Devices don't know their public IP addresses, so NAT translates our devices' private IPs into public IPs that others can reach us at. NAT operates on the router.

Your device connects to your router's IP address, the router takes your private IP and converts it to a public IP, and that publicly accessible IP is broadcast out to the world. When others try to reach you, they ultimately reach your router's public IP and your router translates that back to your device's private IP.

There are four different NAT types: Full Cone NAT (normal NAT), Address-Restricted NAT, Port-Restricted NAT, and Symmetric NAT. All of these work well with WebRTC *except* Symmetric NAT. More info on the four NAT types [here](https://dh2i.com/kbs/kbs-2961448-understanding-different-nat-types-and-hole-punching/).

<br />

**STUN Server**: Session Traversal Utilities for NAT

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-STUN.jpg" alt="STUN server"/>
</div>

*A STUN Server Example*

<br />

A STUN server's main job is to tell a client what its public IP address/port is through NAT.

Talking to a STUN server is step one. We need to find *our* public presence so we can communicate that information to someone else. Once someone else has that information, we can try to communicate.

STUN servers are cheap to maintain, and many are available for you to use for free by Google and others.

<br />

**TURN Server**: Traversal Using Relays around NAT

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-TURN.jpg" alt="TURN server"/>
</div>

*A TURN Server example*

<br />

As I mentioned previously, WebRTC does not work well with Symmetric NAT. This is caused by Symmetric NAT blocking communications with the STUN server.

If a router is using Symmetric NAT, STUN won't work, and we'll have to fall back to a TURN server. This gets rid of the peer-to-peer benefit of WebRTC, and requires all communication to pass through this single TURN server, which could turn into a bottleneck with heavy usage.

If a TURN server is required, many people argue to just use a standard web server with a reverse proxy instead. Theoretically this would give you similar functionality while allowing you to have more control over the server. I haven't formed a proper opinion on this topic yet.

<br />

**ICE**: Interactive Connectivity Establishment

So we've discussed private IP addresses, public IP addresses, STUN servers, TURN servers, and more. How do we know which option is the best to connect with?

This is the primary job of ICE.

ICE collects all available candidates to use (called ICE candidates), and sends them to the remote peer via SDP.

<br />

**SDP**: Session Description Protocol

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-SDP.jpg" alt="SDP example"/>
</div>

*An SDP Example*

<br />

SDP is the most important concept in WebRTC.

Despite its name, SDP is less of a protocol and more of a *format*. It describes all ICE candidates, networking options, media options (audio/video), security options, and more, and combines it all into one massive string.

In order for another person to connect with us, we need to **signal** our SDP. WebRTC does not care how this is done. Once you have your SDP string, it can be signaled out via a QR code, a messaging app like WhatsApp or iMessage, via WebSockets, via HTTP, or anything else. We just need to get that large SDP string to the other party.

<br />

## Revisiting the WebRTC Lifecycle

Now that we have an understanding of the basic WebRTC concepts and terminology, let's revisit a standard WebRTC communication lifecycle with some more detail.

* Client *A* wants to connect to Client *B*

* *A* creates an **offer**. The offer is just the SDP string that consists of all ICE candidates, security options, audio/video options, etc

* *A* signals that offer to *B*. Again, it doesn't matter how this signaling happens (iMessage, HTTP request, etc).

(Every client has two SDP descriptions, a local SDP description and a remote SDP description)

* At this point, *A* has already set its own local SDP description to the offer it created in bullet 2.

* *B* now sets *A*'s **offer** as its remote SDP description

* *B* creates an **answer**, and sets that answer as its own local SDP description

* *B* signals the **answer** to *A*, and *A* sets *B*'s answer as *A*'s remote SDP description.

* The connection is created, and data can flow between the two clients

<br />

## A Vanilla Implementation

Let's explore how to create a basic WebRTC connection between two peers using the vanilla WebRTC implementation. No libraries or anything extra on top of it - just the basics so you really understand what's happening here. You could run this code directly in two browsers via the browsers' dev tools and it would work.

***Browser One***

1. Create the local peer connection

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-code-localConnection.png" alt="WebRTC local connection code"/>
</div>

<br />

2. Create a data channel from that connection

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-code-dataChannel.png" alt="WebRTC data channel code"/>
</div>

<br />

3. Set up listeners on this channel for when a message is received (onmessage) and when a connection is opened (onopen)

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-code-dataChannelListeners.png" alt="WebRTC data channel listeners code"/>
</div>

<br />

4. Set up a listener on the on the local connection for new ICE candidates. Print the SDP string every time we get a new ICE candidate. This will provide examples of what SDP strings look like.

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-code-onIceCandidateListener.png" alt="WebRTC ice candidate listener code"/>
</div>

<br />

5. Create the offer locally, and set that offer as our local SDP description

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-code-localCreateOffer.png" alt="WebRTC local create offer code"/>
</div>

<br />

***Browser Two***

Now open a new browser window, and we'll connect the two browsers together

1. After running the previous commands in browser one, you should have an SDP offer string printed out in your browser's dev tools. Copy and paste that from browser one, and set it to a new variable in browser two. It should look something like this:

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-code-offerVariable.png" alt="WebRTC offer variable code"/>
</div>

<br />

2. Create the remote peer connection

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-code-remoteConnection.png" alt="WebRTC remote connection"/>
</div>

<br />

3. Print the SDP string every time we get a new ICE candidate on the remote side this time

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-code-remoteOnIceCandidate.png" alt="WebRTC remote onIceCandidate listener example"/>
</div>

<br />

4. Set up a listener on the remote connection that will receive the data channel from the other connection

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-code-remoteOnDataChannel.png" alt="WebRTC remote onDataChannel listener"/>
</div>

<br />

5. Set our remote and local SDP descriptions based on the offer we received (remote SDP description) and the answer we sent (local SDP description)

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-code-sdpDescriptions.png" alt="WebRTC SDP descriptions code"/>
</div>

<br />

***Back to Browser One***

1. Set the answer SDP we just generated in the previous step to an answer variable

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-code-answerVariable.png" alt="WebRTC answer variable code"/>
</div>

<br />

2. We're coming full circle now. In the first section, we set the local connection's local description. In the second section, we set the remote connection's local & remote descriptions. And now, we close the loop by setting the local connection's remote description to the answer we just got in the previous step. This opens the connection between the two peers.

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-code-setLocalRemoteDescription.png" alt="WebRTC setLocalRemoteDescription code"/>
</div>

<br />

3. The connection is now open, and we can send data back and forth between the two browsers.

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-code-dataChannelSend.png" alt="WebRTC send message code"/>
</div>

<br />

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-code-remoteDataChannelSend.png" alt="WebRTC remote send message code"/>
</div>

<br />

4. You should see each those messages in the other browser's dev tools now. 👍

<br />

## WebRTC Pros and Cons

***Pros***:

* Having a peer-to-peer connection is fantastic. It allows for low latency and high-bandwidth content to be shared seamlessly

* WebRTC provides a standardized way for devices to implement this functionality with an API that we don't have to build ourselves

***Cons***:

* Maintaining STUN and TURN servers
    * STUN isn't too bad since there are free STUN servers publicly available (google maintains some for free)
    * TURN is expensive and more difficult, and no one offers them for free use like STUN servers
    
* Peer-to-Peer can fall apart in cases of many participants
    * If you have 100 people in one environment, maintaining peer-to-peer connections between all 100 people isn't viable. This would be 99x100 connections.
    * A centralized server makes more sense here. Everyone connects to the centralized server, and you maintain the connection and traffic rules on that server.
    * More latency in this scenario, but much more viable
    * Large online games don't use WebRTC, for example. They use a centralized server people connect to.
    
<br />

## Powering Up with Amazon Kinesis Video Streams

As mentioned, one of the cons of WebRTC is the need to maintain and manage various STUN and TURN servers.

[Amazon Kinesis Video Streams with WebRTC](https://docs.aws.amazon.com/kinesisvideostreams-webrtc-dg/latest/devguide/what-is-kvswebrtc.html) offers a potential answer to this problem, as well as handling signaling for you.

In AWS's words, Amazon Kinesis Video Streams (KVS) "provides a standards-compliant WebRTC implementation as a fully managed capability. You can use Amazon Kinesis Video Streams with WebRTC to securely live stream media or perform two-way audio or video interaction between any camera IoT device and WebRTC-compliant mobile or web players. As a fully managed capability, you don't have to build, operate, or scale any WebRTC-related cloud infrastructure, such as signaling or media relay servers to securely stream media across applications and devices."

Using this service abstracts away the need to manage your own STUN and TURN servers while optimizing for even lower latency and higher bandwidth streaming.

There's a fantastic walkthrough of how to get up and running with this service [here](https://aws.amazon.com/blogs/media/enabling-video-chats-using-amazon-kinesis-video-streams-for-webrtc/). Familiarity with AWS isn't necessarily required to follow that video, but is certainly helpful.

<br />

<div class="resizable-image">
    <img src="../../blog_images/learning-webrtc/webrtc-kvs.png" alt="AWS KVS with WebRTC Diagram"/>
</div>

*AWS Kinesis Video Streams with WebRTC Architecture Diagram*

<br />

I was able to build a very performant peer-to-peer video streaming application by building on top of the aforementioned walkthrough. I recommend giving it a try and seeing how it goes for you. There's also some fantastic sample code [on GitHub](https://github.com/awslabs/amazon-kinesis-video-streams-webrtc-sdk-js).

<br />

## Resources I Used

* Getting Started with WebRTC on <a href="https://webrtc.org/getting-started/overview" target="_blank">WebRTC.org</a>

* WebRTC API on the <a href="https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API" target="_blank">Mozilla Developer Network</a>

* WebRTC Crash Course on <a href="https://www.youtube.com/watch?v=FExZvpVvYxA" target="_blank">YouTube</a>
    * This was particularly helpful. I highly recommend you take the time to watch the full thing.
    * Many of the concepts in this post were inspired directly by this video.
    
* Introduction to WebRTC on <a href="https://www.youtube.com/watch?v=NdEEp_WvnvU&t=705s" target="_blank">YouTube</a>

* What is Kinesis Video Streams with WebRTC from <a href="https://docs.aws.amazon.com/kinesisvideostreams-webrtc-dg/latest/devguide/what-is-kvswebrtc.html" target="_blank">AWS</a>

* Kinesis Video Streams with WebRTC: How it Works from <a href="https://docs.aws.amazon.com/kinesisvideostreams-webrtc-dg/latest/devguide/kvswebrtc-how-it-works.html" target="_blank">AWS</a>

* Enabling Video Chats Using Amazon Kinesis Video Streams with WebRTC from <a href="https://aws.amazon.com/blogs/media/enabling-video-chats-using-amazon-kinesis-video-streams-for-webrtc/" target="_blank">AWS</a>

* Amazon Kinesis Video Streams implementation on <a href="https://github.com/awslabs/amazon-kinesis-video-streams-webrtc-sdk-js" target="_blank">GitHub</a>

<br />

## A Final Note

There are a lot of YouTube videos that claim to teach you WebRTC by "building a Zoom clone" or something similar. I worked through a couple of these and found them to be less than valuable. Most layer on a bunch of third party libraries like socket.io, simple-peer, peer.js, and others to handle the dirty work.

In my opinion, it's far better to really understand the basics before lumping on these libraries.

<br />

**<a href="#">Back to Top</a>**
