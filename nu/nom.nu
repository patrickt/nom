(import Foundation) ; TODO: check to see if this is necessary.
(load "nom:elements")
(load "nom:functions")
(load "nom:extensions")
(load "match")

(set $output (NSFileHandle fileHandleWithStandardOutput))

(function write (*args)
    (*args each:(do (item) ($output writeString: (item stringValue)))))

(function key-value-pairs? (item)
    (set is YES)
    (item eachPair:(do (key value)
        (if is (set is (and (symbol? key) (string? value) (key isLabel))))))
    is)

(function plist? (item)
    (and (pair? item) (eq (% (item count) 2) 0) (key-value-pairs? item)))

(function emit-html (item)
    (cond 
        ; The item is a string, number, etc.
        ((atom? item) (write item))
        ; The item is an html sexp
        ((html-element? (item 0))
            (set element-name ((item 0) stringValue))
            (set possible-attributes (item 1))
            (set has-attributes? (plist? possible-attributes))
            (set contents
                (if has-attributes? (cdr (cdr item))
                    (else (cdr item))))
            (if contents
                (if has-attributes?
                    (write (element-name asOpenTagWithAttributes:possible-attributes))
                    (else (write (element-name asOpenTag)))))
            (contents each:(do (c) (emit-html c)))
            (if contents
                (write (element-name asCloseTag))
                (else (write (element-name asSelfClosingTag)))))
                ; The item is a function or macro or something
        (else (write ((eval item) stringValue)))))


(global nom (do (item)
    (cond
        ((item isKindOfClass:NSString)
            ;; It's a file location, so just re-call this with the contents of the file location as HTML
            ;; The cadr is to work around the fact that the NuParser wraps everything in a progn.
            (nom (car (cdr ((NuParser new) parse:(NSString stringWithContentsOfFile:item))))))
        ((item isKindOfClass:NuCell)
            (emit-html item)
            (write "\n")
            ""))))