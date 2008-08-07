(html
     (head
          (title "Nuki!")
          (meta http-equiv: "Content-Type" content:"text-html")
          ; Perhaps make a stylesheet-link-tag helper?
          (link href="/nuki.css" media:"all" rel:"Stylesheet" type:"text/css"))
     (body
          (div id:main is
               (div id:header is "I'm a header!")
               (h1 (a href:"/" is "Nuki"))
               (h2 "A pure-Nu wiki.")
               (div id:menu is
                    (ul
                       (li (a href:"/" is "Front page"))
                       (li (a href:"/pages" is "List of pages")))))
          (div id:content is
               "This page doesn't exist yet. But you can create it!")
          (div id:footer is
               (p
                 "&copy; 2007 "
                 (a href:"http://importantshock.wordpress.com" is "Patrick Thomson.")
                 "A " (a href:"http://programming.nu" is "Nu&#8482;") " thing."))))