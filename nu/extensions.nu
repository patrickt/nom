(function htmlize-attributes (plist)
     (set result "")
     (plist eachPair:(do (key value)
                         (result << "#{(key labelName)}=#{value} ")))
     (result stringByTrimmingCharactersInSet:(NSCharacterSet whitespaceCharacterSet)))

(class NuCell
     
     (- (id) containsObject:(id)item is
          (not (eq nil (self find:(do (ii) (eq ii item))))))
     
     ;; Join the elements of a list into a string with list elements separated by spaces.
     (- (id) join is
          ((NSArray arrayWithList:self) componentsJoinedByString:" "))
     
     )

(class NSMutableString
     (- (id) << (id)toAppend is
          (self appendString:toAppend)))

(class NSMutableString
     (- (id) asOpenTag is "<#{self}>")
     (- (id) asSelfClosingTag is "<#{self} />")
     (- (id) asCloseTag is "</#{self}>")
     (- (id) asOpenTagWithAttributes:(id)attrs is "<#{self} #{(htmlize-attributes attrs)}>")
     (- (id) asSelfClosingTagWithAttributes:(id) attrs is "<#{self} #{(htmlize-attributes attrs)} />"))