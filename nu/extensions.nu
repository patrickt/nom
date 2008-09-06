(class NSObject
     ;; Only symbolsWithAColonLikeThis: are labels.
     (- (id) isLabel is NO))

(class NSFileHandle
     (- (id) writeString:(id)str is
        (self writeData:(str dataUsingEncoding:NSUTF8StringEncoding))))

(class NSMutableString
     
     (- (id) asOpeningTag is "<#{self}>")
     (- (id) asSelfClosingTag is "<#{self} />")
     (- (id) asClosingTag is "</#{self}>")
     
     (- (id) asOpeningTagWithAttributes:(id)attrs is "<#{self} #{(attrs asHTMLAttributes)}>")
     (- (id) asSelfClosingTagWithAttributes:(id) attrs is "<#{self} #{(attrs asHTMLAttributes)} />")
     
     ;; There are a million implementations of #strip. Here's another.
     (- (id) strip is
        (self stringByTrimmingCharactersInSet:(NSCharacterSet whitespaceCharacterSet))))

(class NSNumber
     (- (id) even? is (eq (% self 2) 0))
     (- (id) odd? is (not even)))

(class NuCell
     
     ;; Determines whether this cell represents a property list with labels and values.
     (- (id) propertyList? is
        (set symbolValidity (array))
        (self eachWithIndex:(do (object idx)
                                (if (idx even?) (array appendObject:(object isLabel)))))
        (and ((self count) even?) (all symbolValidity)))
     
     ;; Horay, a containsObject that doesn't use #arrayWithList:
     (- (id) containsObject:(id)item is
        (not (eq nil (self find:(do (ii) (eq ii item))))))
     
     ;; Join the elements of a list into a string with list elements separated by spaces.
     (- (id) join is
        ((NSArray arrayWithList:self) componentsJoinedByString:" "))
     
     ;; Takes a property list and turns it into an HTML-suitable string.
     (- (id) asHTMLAttributes is
        (unless ((self count) even?) (return nil))
        (set attributes (NSMutableString stringWithCapacity:45)) ; Thanks, @rentzsch
        (self eachPair:(do (key value)
                           ;; This shouldn't even matter because of #propertyList?
                           (unless (key isLabel) (return nil))
                           ;; Evaluate an expression to get its value if it's a cell
                           (if (value isKindOfClass:NuCell) (set value (eval value)))
                           ;; Wrap the value in quotes in a string.
                           (if (value isKindOfClass:NSString) (set value "\"#{value}\""))
                           (attributes appendString:"#{(key labelName)}=#{value} ")))
        (attributes strip)))