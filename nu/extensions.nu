(class NSObject
    (- (id) isLabel is NO))

(class NSMutableString
     (- (id) << (id)toAppend is
        (self appendString:toAppend))
     (- (id) asOpenTag is "<#{self}>")
     (- (id) asSelfClosingTag is "<#{self} />")
     (- (id) asCloseTag is "</#{self}>")
     (- (id) asOpenTagWithAttributes:(id)attrs is "<#{self} #{(attrs asHTMLAttributes)}>")
     (- (id) asSelfClosingTagWithAttributes:(id) attrs is "<#{self} #{(attrs asHTMLAttributes)} />")
     (- (id) strip is (self stringByTrimmingCharactersInSet:(NSCharacterSet whitespaceCharacterSet))))

(function htmlize-attributes (plist)
     (set result "")
     (plist eachPair:(do (key value)
                         (result << "#{(key labelName)}=#{value} ")))
     (result stringByTrimmingCharactersInSet:(NSCharacterSet whitespaceCharacterSet)))

(class NSNumber
     (- (id) even? is
        (eq (% self 2) 0)))

(class NuCell
     
     (- (id) containsObject:(id)item is
        (not (eq nil (self find:(do (ii) (eq ii item))))))
     
     ;; Join the elements of a list into a string with list elements separated by spaces.
     (- (id) join is
        ((NSArray arrayWithList:self) componentsJoinedByString:" "))
     
     (- (id) asHTMLAttributes is
        (unless ((self count) even?) (return nil))
        (set attributes (NSMutableString stringWithCapacity:45)) ; Thanks, @rentzsch
        (self eachPair:(do (key value)
                           (unless (key isLabel) (return nil))
                           (if (value isKindOfClass:NuCell) (set value (eval value)))
                           (attributes appendString:"#{(key labelName)}=#{value} ")))
        ; This, sirs, is terrible.
        (set stripped (attributes strip))
        (if (eq stripped "") nil (else stripped))))