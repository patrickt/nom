(class NuCell
     ;; Join the elements of a list into a string with list elements separated by spaces.
     (imethod (id) join is
          ((NSArray arrayWithList:self) componentsJoinedByString:" "))
    
    (imethod (id) handleUnknownMessage:(id)msg withContext:(id)ctx is
        ((NSArray arrayWithList:self) sendMessage:msg withContext:ctx)))

(class NSMutableString
    (imethod (id) << (id)toAppend is
        (self appendString:toAppend)))