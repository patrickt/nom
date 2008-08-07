(class HTMLGenerator is NSObject
    (- (id) process:(id)form is
        (if (html? form)
            (self processHTML: form)
            (else
                (throw* "NomException" "malformed nom form passed to #process"))))
                
    (- (id) processHTML:(id)form is
        (match-set (tag attributes body) (parse-syntax form))
        )))