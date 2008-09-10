(import Foundation)
(load "nom:functions")
(load "nom:extensions")
(load "nom:emitter")
(load "match")

(global nom (do (item)
    (cond
        ((item isKindOfClass:NSString)
            (set head nil)
            ;; It's a file location, so just re-call this with the contents of the file location as HTML
            ;; The cadr is to work around the fact that the NuParser wraps everything in a progn.
            (set file-contents (cdr ((NuParser new) parse:(NSString stringWithContentsOfFile:item))))
            (set emitter (HTMLEmitter new))
            (file-contents each:(do (item)
                (emitter emit:item)))
            nil)
        ((item isKindOfClass:NuCell)
            ((HTMLEmitter new) emit:item)))))