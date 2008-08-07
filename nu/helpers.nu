(macro html)

(class NuCell
     (- (id) array is (NSArray arrayWithList:self))
     
     (- (id) containsObject:(id)obj is
        ((self array) containsObject: obj)))

(function escape-character )

(class NSObject
     (- in? (id)sequence is
        (sequence containsObject: self)))

(class NSString
     (- (id) sub:(id)re with:(id)string is
        (re replaceWithString:string inString:self))
     
     (- (id) escapeCharacters:(id)chrs
        (set escaped self)
        
        )
     
     (- (id) escapeHTMLElements is
        ((((((self sub: /&/ with: "&amp;")
             sub: />/  with: "&gt;")
            sub: /</  with: "&lt;")
           sub: /'/ with: "&apos;")
          sub: /"/ with: "&quot;"))))

(function symbol? (item) (item isKindOfClass:NuSymbol))

(function valid-syntax? (form test)
     (unless test (set test symbol))
     (and (pair? form)
          (or (apply test (car form))
              (and (pair? (car form)) (apply test (second form))))))

(function self-evaluating? (form)
    (atom? form))              

(function parse-syntax (expr)
     (if (pair? (first expr))
         (parse-explicit-attributes expr)
         (else (parse-implicit-attributes expr))))

(function parse-explicit-attributes (expr)
     (match-set ((tag . attributes) body) expr)
     (list tag attributes body))

(function parse-implicit-attributes (expr)
     (set tag (first expr))
     (set attributes '())
     (set body (cdr expr))
     ((cdr expr) eachPair:
      (do (tag val)
          (unless (and (symbol? tag) val)
                  break)
          (set body (car (car body)))
          (set attributes (cons tag (cons val attributes)))))
     (list tag attributes body))


(function escape (to-escape) (to-escape escapeHTMLElements))


(function html? (form)
    (or (self-evaluating? form) (valid-syntax? form)))