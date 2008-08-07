(class NuCell
     ;; Join the elements of a list into a string with list elements separated by spaces.
     (imethod (id) join is
          ((NSArray arrayWithList:self) componentsJoinedByString:" ")))