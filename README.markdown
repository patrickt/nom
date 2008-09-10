# nom: Nu on Markup #
nom (all lowercase, please) is a Nu library designed to translate s-expressions into HTML code. Because HTML (and XML) are basically reinventions of s-expressions, there is a pleasant isomorphism between the two. nom can translate a given s-expression or the contents of a file into HTML code. Here's an example of a valid, nom-translatable s-expression (found in test/sample.nom.nu):

    `(doctype)
    (html
         (head
              (title "Nuki!")
              (meta (http-equiv: "Content-Type" content:"text-html")))
        (body
            (div (id:"main")
                 (div (id:"header")
                    "I'm a header!"))))`
                
And here's the output from running `(nom "test/sample.nom.nu")`:

    `<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Frameset//EN" "http://www.w3.org/TR/REC-html40/frameset.dtd">
    <html>
      <head>
        <title>
    Nuki!
        </title>
        <meta http-equiv="Content-Type" content="text-html" />
      </head>
      <body>
        <div id="main">
          <div id="header">
    I'm a header!
          </div>
        </div>
      </body>
    </html>`

## Why? ##

nom was written in the course of a few days. The chapter from Practical Common Lisp in which Seibel writes an [HTML generation library](http://gigamonkeys.com/book/practical-an-html-generation-library-the-interpreter.html) was an indispensable resource, though the nom codebase is much shorter than the corresponding Common Lisp code. :-) I am aware of Dean Mao's NuSAX, but wrote nom to solve a very different problem - whereas NuSAX is designed for serialization and marshaling s-expressions to XML, nom is intended to make writing HTML as painless as possible. Much like Haml, nom is designed to make HTML as concise as possible, and as such comes with utility functions to make certain HTML idioms easy.

## Caveat Programmator ##

nom has not been tested in a production environment, and was written as an intellectual exercise. It may be very slow on large data sets, it may crash, and it is probably filled with every kind of bug imaginable. I am in no way responsible for any catastrophes that may occur. nom is released under the Apache License, v2.0, but I would appreciate a kind email or postcard if you use or like it.

## Issues ##

As of right now, I cannot figure out how to make nom write to a string rather than standard output or a file. If you have any suggestions, please let me know. Pull requests are encouraged and accepted.

nom also needs more helper functions.

Parts of the code are *really* shifty, but I'm tired of sitting on this.

## Thanks ##

[Tim Burks](http://programming.nu), for creating my favorite programming language
[Hampton Caitlin](http://hamptoncatlin.com/), for writing [Haml](http://haml.hamptoncatlin.com/).
[Peter Siebel](http://gigamonkeys.com/book/)'s Practical Common Lisp, which was invaluable.