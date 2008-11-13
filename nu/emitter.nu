(load "nom:elements")
(load "nom:extensions")

(class HTMLEmitter is NSObject
     (ivars) (ivar-accessors)
     
     (- (id) init is
        (super init)
        (set @indentation 0)
        (set @output (NSMutableString stringWithCapacity:1000))
        self)
     
     (- (id) indent is (@indentation times:(do (i) (self write: "\t"))))
     
     (- (id) write:(id)item is
        (@output writeString:(item stringValue)))
     
     (- (id) writeOpeningTag:(id)item withAttributes:(id)attrs is
        (self indent)
        (@output writeString:
            (if attrs
                (item asOpeningTagWithAttributes:attrs)
                (else (item asOpeningTag))))
        (set @indentation (+ @indentation 1))
        (self write:"\n"))

     (- (id) writeSelfClosingTag:(id)item withAttributes:(id)attrs is
        (self indent)
        (@output writeString:
            (if attrs
                (item asSelfClosingTagWithAttributes:attrs)
                (else (item asSelfClosingTag)))))
    
     (- (id) writeClosingTag:(id)item is
        (set @indentation (- @indentation 1))
        (self indent)
        (self write:(item asClosingTag)))

     
     (- (id) emit:(id)item is
        (cond
             ((atom? item) (self write: item))
             ; The item is an html sexp
             ((html-element? (item 0))
              (set element-name ((item 0) stringValue))
              (set possible-attributes (item 1))
              (set has-attributes? (possible-attributes propertyList?))
              (set contents
                   (if has-attributes?
                       (cdr (cdr item))
                       (else (cdr item))))
              (if contents 
                  (self writeOpeningTag:element-name withAttributes:(if has-attributes? possible-attributes))
                  (contents each:(do (c) (self emit:c) (self write:"\n")))
                  (self writeClosingTag:element-name)
                  (else
                      (self writeSelfClosingTag:element-name withAttributes:(if has-attributes? possible-attributes)))))
             (else
                  (self write: ((eval item) stringValue))))))