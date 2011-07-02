(require "ffi.arc")

(w/ffi (string arclib* "/site/markdown") ; TODO: fix library path
 (cdef arc-mkd-string  "arc_mkd_string"  cptr    (cstring cint))
 (cdef arc-mkd-cleanup "arc_mkd_cleanup" cvoid   (cptr))
 (cdef arc-markdown    "arc_markdown"    cstring (cptr cint)))

(= md-nolinks*         #x00000001 ; don't do link processing, block <a> tags
   md-noimage*         #x00000002 ; don't do image processing, block <img>
   md-nopants*         #x00000004 ; don't run smartypants()
   md-nohtml*          #x00000008 ; don't allow raw html through AT ALL
   md-strict*          #x00000010 ; disable SUPERSCRIPT, RELAXED_EMPHASIS
   md-tagtext*         #x00000020 ; process text inside an html tag; no * <em>, no <bold>, no html or [] expansion
   md-no-ext*          #x00000040 ; don't allow pseudo-protocols
   md-cdata*           #x00000080 ; generate code for xml ![CDATA[...]]
   md-nosuperscript*   #x00000100 ; no A^B
   md-norelaxed*       #x00000200 ; emphasis happens /everywhere/
   md-notables*        #x00000400 ; disallow tables
   md-nostrikethrough* #x00000800 ; forbid ~~strikethrough~~
   md-toc*             #x00001000 ; do table-of-contents processing
   md-1-compat*        #x00002000 ; compatibility with MarkdownTest_1.0
   md-autolink*        #x00004000 ; make http://foo.com link even without <>s
   md-safelink*        #x00008000 ; paranoid check for link protocol
   md-noheader*        #x00010000 ; don't process header blocks
   md-tabstop*         #x00020000 ; expand tabs to 4 spaces
   md-nodivquote*      #x00040000 ; forbid >%class% blocks
   md-noalphalist*     #x00080000 ; forbid alphabetic lists
   md-nodlist*         #x00100000 ; forbid definition lists
   md-extra-footnote*  #x00200000 ; enable markdown extra-style footnotes
  )

(def markdown (str (o flags (list md-autolink* md-extra-footnote*)))
  (withs (flg (apply scheme.bitwise-ior flags)
          doc (arc-mkd-string str flg)
          htm (arc-markdown doc flg))
    (arc-mkd-cleanup doc)
    htm))
