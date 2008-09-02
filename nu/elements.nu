(load "extensions")

;; Man, there are a lot of obscure HTML tags.

(global ELEMENTS
    '(a abbr acronym address area b base bdo big blockquote body br caption
        button caption cite code col colgroup dd del dfn div dl dt em
        fieldset form frame frameset h1 h2 h3 h4 h5 h6 head hr html 
        i iframe img input ins kbd label legend li link map meta noframes
        noscript object ol optgroup option p param pre q samp select small
        span strong style sub sup table tbody td textarea tfoot th thead
        title tr tt ul var))

(function html-element? (item)
    (ELEMENTS containsObject:item))
