(puts "loading exts")

(function htmlize-attributes (plist)
    (set result "")
    (plist eachPair:(do (key value)
        (result << "#{(key labelName)}=#{value} ")))
    (result stringByTrimmingCharactersInSet:(NSCharacterSet whitespaceCharacterSet)))

(class NuCell
     ;; Join the elements of a list into a string with list elements separated by spaces.
     (imethod (id) join is
          ((NSArray arrayWithList:self) componentsJoinedByString:" "))
    
    (imethod (id) handleUnknownMessage:(id)msg withContext:(id)ctx is
        ((NSArray arrayWithList:self) sendMessage:msg withContext:ctx)))

(class NSMutableString
    (imethod (id) << (id)toAppend is
        (self appendString:toAppend)))

(class NSMutableString
    (- (id) asOpenTag is "<#{self}>")
    (- (id) asSelfClosingTag is "<#{self} />")
    (- (id) asCloseTag is "</#{self}>")
    (- (id) asOpenTagWithAttributes:(id)attrs is "<#{self} #{(htmlize-attributes attrs)}>")
    (- (id) asSelfClosingTagWithAttributes:(id) attrs is "<#{self} #{(htmlize-attributes attrs)} />"))