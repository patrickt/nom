(defmacro closed-tag
  `(macro ,(car margs)
    (set __tagname (send ,(car margs) name))
    ("</#{__tagname}>")))

(closed-tag br)
(puts ((context) description))
