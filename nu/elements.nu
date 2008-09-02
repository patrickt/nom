(load "extensions")

;; Man, there are a lot of obscure HTML tags.

(global BLOCK-ELEMENTS
        '(body colgroup dl fieldset form head_ html map noscript object
               ol optgroup pre script select style table tbody tfoot thead
               tr ul))

(global PARAGRAPH-ELEMENTS
        '(area base blockquote br button caption col dd div dt h1
               h2 h3 h4 h5 h6 hr input li link meta option p param
               td textarea th title))

(global INLINE-ELEMENTS
        '(a abbr acronym address b bdo big cite code del dfn em
            i img ins kbd label legend q samp small span strong sub
            sup tt var))

(global EMPTY-ELEMENTS '(area base br col hr img input link meta param))

(global WHITESPACE-PRESERVING-ELEMENTS '(pre script style))

(global ELEMENT-GROUPS '(BLOCK-ELEMENTS PARAGRAPH-ELEMENTS INLINE-ELEMENTS EMPTY-ELEMENTS WHITESPACE-PRESERVING-ELEMENTS))