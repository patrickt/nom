(import Foundation)

;; Returns a two-value list consisting of the HTML attributes for the tag and the contents of the tag, if any.
(function extract-attributes (args)
    (set arrayed-args (NSArray arrayWithList: args))
    (set is-position (arrayed-args indexOfObject: 'is))
    (cond
        ((not args)
          (list nil nil))
         ; There is an 'is' separating the argument list and the body
         ((!= is-position NSNotFound)
          (list (args car) ((args cdr) cdr)))
         ; This is, in all probability, an argument list
         ((and ((args car) isKindOfClass: NuSymbol) ((args car) isLabel))
          (list args nil))
         ; Otherwise, it's just a list of items to insert inside the tag
         (else (puts "body") (list nil args))))

(function htmlize-attributes (attrs)
  (if attrs (attrs stringValue) (else "")))

(defmacro tag
     `(macro ,(car margs)
           (set __tagname (send ,(car margs) name))
           (set __attributes (extract-attributes margs))
           (set __html-attributes (htmlize-attributes (__attributes 0)))
           (set __body (__attributes 1))
           (if (eq __html-attributes "") (puts "NO HEAD"))
           "<#{__tagname} #{__html-attributes}/>"))

(tag br)
(tag html)
(tag body)
(tag meta)
(puts ((context) description))
(puts (br))
(puts (meta content-type:"food"))