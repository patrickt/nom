(import Foundation)
(load "nom:functions")
(load "nom:extensions")
(load "nom:emitter")
(load "match")

(global nom (do (item)
    (cond
        ((item isKindOfClass:NSString)
            ;; It's a file location, so just re-call this with the contents of the file location as HTML
            ;; The cadr is to work around the fact that the NuParser wraps everything in a progn.
            ((HTMLEmitter new) emit: (car (cdr ((NuParser new) parse:(NSString stringWithContentsOfFile:item))))))
        ((item isKindOfClass:NuCell)
            ((HTMLEmitter new) emit:item)))))