---
layout: post
title:  "Your First Post on Bridgetown"
date:   2020-12-21 10:39:23 +0100
categories: updates
subtitle: "This is the subtitle"
summary: "This works! YAYY! Unicorns & Rainbows"
content_sections:
  - "Varja Varja VARJA!! Hagassa meg! En csak 1-et akarok: ELERNI A VEGCELBE!!!!"
  - This is the first section
  - And this is a subsection
  - You should definitely check out this part
  - Wow! Lotz of goodies here!
  - How about this? Cats chewing on green sausages. Yack!
tags:
  - Javascript
  - Ruby
  - GitHub
  - Creative Coding
  - Burnout
  - Thiking Proc
  - Chewing Habs
  - WTF is This ShiT??!$*
---

<div>
  <p class="text-lg mb-6 leading-normal">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Magna ac placerat vestibulum lectus mauris ultrices eros. Nec ullamcorper sit amet risus. Volutpat est velit egestas dui id ornare arcu odio ut. Auctor eu augue ut lectus arcu. Elementum tempus egestas sed sed risus pretium quam. Porttitor eget dolor morbi non. Tellus at urna condimentum mattis pellentesque id nibh. Cursus sit amet dictum sit amet justo. Tellus in metus vulputate eu scelerisque felis imperdiet. </p>
  

        
  <h2 id="subsection-title" class="realtive mt-12 text-4xl mb-6 font-bold leading-9 text-gray-800">
    <a class="absolute pr-1 top-0 left-0 bg-transparent hover:text-gray-900 invisible" href="#post-secton" style="transform: translateX(100%);">
      <svg aria-hidden="true" focusable="false" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg>
    </a>
          This is an example image
  </h2>
        
  <span id="resp-img-container" class="relative block my-12 max-w-4xl ">
      <a href="#" style="">
        <img src="/images/submodule.png" alt="image" loading="lazy">     
      </a>
      </span>
      
  <h3 id="subsection-title" class="realtive mt-12 text-3xl font-semibold mb-4 text-gray-700">
      <a href="#link-to-this-section"></a>
      Let's see how multiple elements play together
    </h3>
    
  <p class="text-lg mb-6 leading-normal">Let's imagine that you want a public blog, located on the <code class="bg-gray-200 px-1 rounded-sm">blog</code> repo, to contain a submodule with all the posts, located in the <code class="bg-gray-200 px-1 rounded-sm">posts</code> repo. So it will look like:</p>
    
  <ul class="text-lg px-8 mb-6 my-0 mt-0 list-initial">
      <li>A public repo at </li>
      <code class="bg-gray-100 px-1 rounded-sm">github.com/you/blog</code>
      <li>A private repo at <code class="bg-gray-200 px-1 rounded-sm">github.com/you/posts</code></li>
    </ul>
    
  <blockquote class="my-8 p-4 bg-pink-100 rounded font-normal">
      <p class="text-lg leading-normal">I'm just using GitHub as an example, it doesn't matter where the repo is hosted. Also, git submodules can also be used for both private and public repos.</p>
    </blockquote>
    
  <p class="text-lg mb-6 leading-normal">First you can <code class="bg-gray-200 px-1 rounded-sm">add</code> the submodule. From the root of <code class="bg-gray-200 px-1 rounded-sm">blog</code>, you would run this command.</p>
    
  <div class="rounded bg-gray-800 text-base mt-2 mb-8 overflow-auto font-mono text-left break-normal font-normal leading-7">
      <pre style="display: block; overflow-x: auto; padding: 0.5em; none repeat scroll 0% 0%; color: rgb(221, 221, 221);"><span style="color: rgb(191, 121, 219);"> $</span> git submodule add https:<span style="color: rgb(117, 113, 94);">//github.com/you/posts</span></pre>
    </div>
    
  <p class="text-lg mb-6 leading-normal">This would clone the <code class="bg-gray-200 px-1 rounded-sm">posts</code> repo into a folder in <code class="bg-gray-200 px-1 rounded-sm">blog</code>.</p>
    
  <div class="text-base overflow-auto font-mono text-left break-normal font-normal leading-7">
      <pre class="language-terminal">  <code class="language-terminal">Cloning into '/Users/you/blog/posts'...</code>
      </pre>
    </div>
    
  <p class="text-lg mb-6 leading-normal"><code class="bg-gray-200 px-1 rounded-sm">.gitmodules</code> will look like this:</p>
    
  <div id="filename" class="px-4 pt-1 pb-2 rounded-t my-auto text-sm -mb-3 leading-7 bg-gray-600 text-white z-10 mt-6">.gitmodules</div>
    
  <div class="rounded bg-gray-800 text-base mt-2 mb-8 overflow-auto font-mono text-left break-normal font-normal leading-7">
      <pre style="display: block; overflow-x: auto; padding: 1.5rem 1em; none repeat scroll 0% 0%; color: rgb(221, 221, 221);">  [submodule <span style="color: rgb(166, 226, 46);">"posts"</span>]
        <span style="color: rgb(166, 226, 46);">path</span> = posts
        url = https:<span style="color: rgb(117, 113, 94);">//github.com/you/posts</span></pre>
    </div>
    
  <h4 class="relative mb-4 mt-12 text-lg font-medium pb-1 border-b-2 border-solid "><a href="#sub-subtitle">We are at the sub-subtitle!</a></h4>
        
  <p class="text-lg mb-6 leading-normal">Egestas fringilla phasellus faucibus scelerisque. Quis lectus nulla at volutpat diam ut venenatis tellus in. Facilisi nullam vehicula ipsum a arcu cursus. Varius quam quisque id diam vel quam elementum pulvinar etiam. Aenean pharetra magna ac placerat vestibulum lectus mauris. Nunc sed id semper risus in hendrerit gravida rutrum.</p>
    <p class="text-lg mb-6 leading-normal">Turpis in eu mi bibendum neque egestas congue quisque egestas. Tristique senectus et netus et malesuada fames. Malesuada nunc vel risus commodo viverra maecenas. Viverra justo nec ultrices dui sapien eget mi. Fermentum leo vel orci porta. Dui vivamus arcu felis bibendum ut tristique et. Fermentum et sollicitudin ac orci phasellus egestas tellus rutrum tellus. </p>
  </div>
  <h2 id="subsection-title" class="realtive mt-12 text-4xl mb-6 font-bold leading-5 text-gray-800">
    <a class="absolute pr-1 top-0 left-0 bg-transparent hover:text-gray-900 invisible" href="#post-secton" style="transform: translateX(100%);">
      <svg aria-hidden="true" focusable="false" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg>
    </a>
    This is a subsection of the post
  </h2>
  <p class="text-lg mb-6 leading-normal">Egestas fringilla phasellus faucibus scelerisque. Quis lectus nulla at volutpat diam ut venenatis tellus in. Facilisi nullam vehicula <a class="underline-pink">this is an example link</a> ipsum a arcu cursus. Varius quam quisque id diam vel quam elementum pulvinar etiam. Aenean pharetra magna ac placerat vestibulum lectus mauris. Nunc sed id semper risus in hendrerit gravida rutrum.</p>
  
  <p class="text-lg mb-6 leading-normal" >Turpis in eu mi bibendum neque egestas congue quisque egestas. Tristique senectus et netus et malesuada fames. Malesuada nunc vel risus commodo viverra maecenas. Viverra justo nec ultrices dui sapien eget mi. Fermentum <b>This is an explale code:</b> <code class="bg-gray-100 px-1 rounded-sm">github.com/you/blog</code> leo vel orci porta. Dui vivamus arcu felis bibendum ut tristique et. Fermentum et sollicitudin ac orci phasellus egestas tellus rutrum tellus. </p>