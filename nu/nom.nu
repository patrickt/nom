(import Foundation) ; TODO: check to see if this is necessary.
(load "nom:elements")
(load "nom:extensions")
(load "match")

(function key-value-pairs? (item)
    (set is YES)
    (item eachPair:(do (key value)
        (if is (set is (and (symbol? key) (string? value))))))
    is)

(function plist? (item)
    (and (pair? item) (eq (% (item count) 2) 0) (key-value-pairs? item)))

(function emit-html (item)
    (puts "emitting for item #{item}")
    (cond 
        ; The item is a string, number, etc.
        ((atom? item) ($results << (item stringValue)))
        ; The item is an html sexp
        ((html-element? (item 0))
            (set element-name ((item 0) stringValue))
            (puts "Element name: #{element-name}")
            (set possible-attributes (item 1))
            (puts "Possible attributes are #{possible-attributes}")
            (set has-attributes? (plist? possible-attributes))
            (if has-attributes? (puts "Attributes are #{possible-attributes}"))
            (set contents
                (if has-attributes? (cdr (cdr item))
                    (else (cdr item))))
            (puts "Contents are #{contents}")
            (if contents
                (if has-attributes?
                    ($results << (element-name asOpenTagWithAttributes:possible-attributes))
                    (else ($results << (element-name asOpenTag)))))
            (puts $results)
            (puts "Mapping contents")
            (contents each:(do (c) (emit-html c)))
            (puts $results)
            (if contents
                ($results << (element-name asCloseTag))
                (else ($results << (element-name asSelfClosingTag))))
            (puts $results))
        ; The item is a function or macro or something.
        (else (puts "Item is a function") 
            ($results << ((eval item) stringValue)))))

         
(global nom (do (item)
    (cond
        ((item isKindOfClass:NSString)
            ;; It's a file location, so just re-call this with the contents of the file location as HTML
            (nom ((NuParser new) parse:item)))
        ((item isKindOfClass:NuCell)
            (set $results "")
            (emit-html item)
            $results))))