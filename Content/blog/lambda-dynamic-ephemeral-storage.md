---
date: 2022-06-10 12:00
title: Storyboard Dev Blog: Serverless Compute with Dynamic Ephemeral Storage
description: A repost to an article I published on the Storyboard Dev Blog.
tags: Web, Cloud, Serverless
---

<style type="text/css">
.resizable-image img {
    text-align: center;
    margin: auto;
    width: 100%;
    border-radius: 5px;
}
</style>


# Storyboard Dev Blog: Serverless Compute with Dynamic Ephemeral Storage
June 10, 2022

*A repost to an article I published on the [Storyboard Dev Blog](https://medium.com/storyboard-podcasts/storyboard-dev-blog-serverless-compute-with-dynamic-ephemeral-storage-8fd38c0df93d).*

<br />

---

<br /> <br />

<div class="resizable-image">
    <a href="https://medium.com/storyboard-podcasts/storyboard-dev-blog-serverless-compute-with-dynamic-ephemeral-storage-8fd38c0df93d"
    >
    <img
     src="../../blog_images/lambda-dynamic-ephemeral-storage/dynamic-ephemeral-storage.png" alt="Dynamic Ephemeral Storage with Lambda"/>
    </a>
</div>

[Storyboard Dev Blog: Serverless Compute with Dynamic Ephemeral Storage](https://medium.com/storyboard-podcasts/storyboard-dev-blog-serverless-compute-with-dynamic-ephemeral-storage-8fd38c0df93d)

<br />

I published an article on [Storyboard's Dev Blog](https://medium.com/storyboard-podcasts/storyboard-dev-blog-serverless-compute-with-dynamic-ephemeral-storage-8fd38c0df93d) about how to configure dynamic amounts of ephemeral storage for a Lambda function on a *per-invocation* basis.

AWS does not let you do this natively. You manually set the amount of storage on the function itself, and then you’re done. You *can* edit it after the fact, but you can’t change the amount of storage allocated with each invocation.

In the post, I detail (what I think is) a clever solution to this limitation which can save you a significant amount of money in the long run.

Check out the full post in the link below, and let me know what you think!

<br />

Full link to the post: [https://medium.com/storyboard-podcasts/storyboard-dev-blog-serverless-compute-with-dynamic-ephemeral-storage-8fd38c0df93d](https://medium.com/storyboard-podcasts/storyboard-dev-blog-serverless-compute-with-dynamic-ephemeral-storage-8fd38c0df93d)
