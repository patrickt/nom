(class NuCell
     ;; Join the elements of a list into a string with list elements separated by spaces.
     (imethod (id) join is
          ((NSArray arrayWithList:self) componentsJoinedByString:" ")))


(load "match")
(import Foundation)

(set $HTMLTAGS '(
                 html
                 head
                 meta
                 link
                 title
                 body
                 
                 p
                 a
                 div
                 span
                 h1
                 h2
                 h3
                 br
                 hr
                 
                 img
                 embed
                 
                 ol
                 ul
                 li
                 
                 dl
                 dt
                 dd
                 
                 table
                 tr
                 td
                 th
                 
                 form
                 select
                 input))

($HTML_TAGS each: (do (t) (eval (list tag t))))


;; Returns a two-value list consisting of the HTML attributes for the tag and the contents of the tag, if any.
(function extract-attributes (args)
     (set arguments-array (NSArray arrayWithList:args))
     (set attributes nil)
     (set contents nil)
     (set is-position (arguments-array indexOfObject:'is))
     (cond
          ((!= is-position NSNotFound)
           (set attributes ((arguments-array subarrayWithRange:(list 0 is-position)) list))
           (set r (list (+ is-position 1) (- (args count) (+ is-position 1))))
           (set contents ((arguments-array subarrayWithRange:r) list))
           )
          ((and ((car args) isKindOfClass: NuSymbol) ((car args) isLabel))
           (set attributes args))
          ; Otherwise, it's just a list of items to insert inside the tag
          (else
               (set contents args)))
     (list attributes contents))
     

(function htmlize-attributes (attrs)
     (set result " ")
     (if attrs
         (attrs eachPair: (do (tag item)
            (set result (+ result "#{(tag labelName)}=\"#{item}\"")))))
     
     (result stringByTrimmingCharactersInSet: (NSCharacterSet whitespaceCharacterSet)))

(defmacro tag
     `(macro ,(car margs)
           (set __tagname (send ,(car margs) name))
           (set __attributes (extract-attributes margs))
           (set __html-attributes (htmlize-attributes (__attributes 0)))
           (set __body (__attributes 1))
           (if __body
               (set __inserted nil)
               (if (string? __body) __b))
               (try
                   (eval )
                   )
               (set __inserted (if (string? __body) __body (else (apply list __body))))
               "<#{__tagname}#{__html-attributes}> #{(__inserted join)}</#{__tagname}>"
               (else "<#{__tagname} #{__html-attributes}/>"))))

(function nom (path)
     (html )

(function test ()
     (assert (eq (br) "<br />"))
     (assert (eq (body "hello" "sailors") "<body>hello sailors</body>")))
