(load "elements")
(load "extensions")
(load "match")
(import Foundation)

(function html-element? (item)
    (PARAGRAPH-ELEMENTS containsObject:item))

(function plist? (item)
    (unless (pair? item) (return NO))
    (item eachPair:(do (key value)
        (unless (symbol? key) (return NO))))
    YES)
    
(class NuSymbol
    (- (id) asOpenTag is "<#{self}>")
    
    (- (id) asCloseTag is "</#{self}>"))

(function emit-html (item)
    (cond 
        ((atom? item) 
            ($results << (item stringValue)))
        ((html-element? (item 0))
            (if (plist? (item 1))
                ($results << ((item 0) asOpenTagWithAttributes:(item 1)))
                (set next (cdr (cdr item)))
                (else
                    ($results << ((item 0) asOpenTag))
                    (set next (cdr item))))
            (emit-html next)
            ($results << ((item 0) asCloseTag)))
        (else ($results << (eval item)))))

(function valid-syntax? (sexp)
    (and (pair? sexp)
         (symbol? (car sexp))))
         
(function nom (item)
    (cond
        ((item isKindOfClass:NSString)
            ;; It's a file location, so just re-call this with the contents of the file location as HTML
            (nom ((NuParser new) parse:item)))
        ((item isKindOfClass:NuCell)
            (set $results "")
            (if (valid-syntax? item)
                (emit-html item))
            $results)))