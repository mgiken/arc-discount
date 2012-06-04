(load "markdown.arc")
(load "test.arc")

; markdown -------------------------------------------------------------------

(test is (markdown "\
A First Level Header
====================

A Second Level Header
---------------------

Now is the time for all good men to come to
the aid of their country. This is just a
regular paragraph.

The quick brown fox jumped over the lazy
dog's back.

### Header 3

> This is a blockquote.
> 
> This is the second paragraph in the blockquote.
>
> ## This is an H2 in a blockquote
") "\
<h1>A First Level Header</h1>\n\n\
<h2>A Second Level Header</h2>\n\n\
<p>Now is the time for all good men to come to\nthe aid of their country. This is just a\nregular paragraph.</p>\n\n\
<p>The quick brown fox jumped over the lazy\ndog&rsquo;s back.</p>\n\n\
<h3>Header 3</h3>\n\n\
<blockquote><p>This is a blockquote.</p>\n\n\
<p>This is the second paragraph in the blockquote.</p>\n\n\
<h2>This is an H2 in a blockquote</h2></blockquote>\
")

(done-testing)

; vim:ft=arc
