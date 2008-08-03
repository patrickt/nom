(import Foundation)

;; Returns a two-value list consisting of the HTML attributes for the tag and the contents of the tag, if any.
(function extract-attributes (args)
     (set args (NSArray arrayWithList: args))
     (set is-position (args indexOfObject: 'is))
     (cond
          ; There is an 'is' separating the argument list and the body
          ((!= is-position NSNotFound)
           (list (args car) (args cdr)))
          ; This is, in all probability, an argument list
          (((car args) isLabel)
           (list args nil))
          ; Otherwise, it's just a list of items to insert inside the tag
          (else (list nil args))))

(function htmlize-attributes (attrs)
  "")

(defmacro tag
     `(macro ,(car margs)
           (set __tagname (send ,(car margs) name))
           (set __attributes (extract-attributes margs))
           (set __html-attributes (htmlize-attributes (__attributes 0)))
           (set __body (__attributes 1))
           "<#{__tagname} #{__attributes}/>"))

(tag br)
(tag html)
(tag body)
(puts ((context) description))
(puts (br))