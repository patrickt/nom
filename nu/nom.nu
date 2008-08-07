(load "extensions")
(load "match")
(import Foundation)

(set $HTMLTAGS '(
    html
    head_
    
    ))

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
           (puts "range is #{(r stringValue)}")
           (set contents ((arguments-array subarrayWithRange:r) list))
           )
          ((and ((car args) isKindOfClass: NuSymbol) ((car args) isLabel))
           (set attributes args))
          ; Otherwise, it's just a list of items to insert inside the tag
          (else 
           (set contents args)))
     (list attributes contents))

(function htmlize-attributes (attrs)
    (set result "")
    (if attrs 
        (attrs eachPair: (do (tag item)
        (set result (+ result "#{item}=#{(eval item)}")))))
    result)

(defmacro tag
     `(macro ,(car margs)
           (set __tagname (send ,(car margs) name))
           (set __attributes (extract-attributes margs))
           (set __html-attributes (htmlize-attributes (__attributes 0)))
           (set __body (__attributes 1))
           (if __body
               (set __joined (__body join))
               "<#{__tagname}#{__html-attributes}>#{__joined}</#{__tagname}>"
               (else "<#{__tagname} #{__html-attributes}/>"))))

(tag br)
(tag html)
(tag body)
(tag meta)
(tag div)

(function test ()
     (assert (eq (br) "<br />"))
     (assert (eq (body "hello" "sailors") "<body>hello sailors</body>")))
