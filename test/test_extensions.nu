(load "nom")

(class TestExtensions is NuTestCase
    (- (id) testContainsObject is
        (set list '(1 2 3 4 5))
        (assert_true (list containsObject:1))
        (assert_true (list containsObject:5))
        (assert_false (list containsObject:6))
        (assert_false (list containsObject:"OM NOM NOM NOM")))
        
    (- (id) testJoin is
        (set l1 (list 1 2 3 4 5))
        (set l2 (list "a" "b" "c" "d" "e"))
        (set l3 (list "psychology" "class" "is" "boring"))
        (set l4 (list "what" "happens" "with" 'symbols))
        (set l5 (list "one_element"))
        (assert_equal  "1 2 3 4 5" (l1 join))
        (assert_equal "a b c d e" (l2 join))
        (assert_equal "psychology class is boring" (l3 join))
        (assert_equal "what happens with symbols" (l4 join))
        (assert_equal "one_element" (l5 join)))
    
    (- (id) testAsHTMLAttributes is
        (set valid-1 (id: "one"))
        (set valid-2 (id: "one" class: "refreshing"))
        (set valid-3 (id: "two" class: "tiresome" align:"center"))
        (set invalid-length (id: "one" "blah"))
        (set totally-wrong '(1 2 3 4))
        (set not-labels '("hi" "there"))
        (assert_equal "id=\"one\"" (valid-1 asHTMLAttributes))
        (assert_equal  "id=\"one\" class=\"refreshing\"" (valid-2 asHTMLAttributes))
        (assert_equal "id=\"two\" class=\"tiresome\" align=\"center\"" (valid-3 asHTMLAttributes) )
        (assert_equal (invalid-length asHTMLAttributes) nil)
        (assert_equal (totally-wrong asHTMLAttributes) nil)
        (assert_equal (not-labels asHTMLAttributes) nil))
        
        
    (- (id) testSimpleOpenTags is
        (assert_equal "<div>" ("div" asOpenTag))
        (assert_equal "<span>" ("span" asOpenTag))
        (assert_equal "<head>" ("head" asOpenTag)))
    
    (- (id) testSimpleClosingTags is
        (assert_equal "</div>" ("div" asCloseTag))
        (assert_equal "</span>" ("span" asCloseTag))
        (assert_equal "</head>" ("head" asCloseTag)))
    
    (- (id) testSimpleSelfClosingTags is
        (assert_equal "<hr />" ("hr" asSelfClosingTag))
        (assert_equal "<br />" ("br" asSelfClosingTag)))
    
    (- (id) testAttributesWithOpenTags is
        (assert_equal "<div id=1>" ("div" asOpenTagWithAttributes:'(id: 1)))
        (assert_equal "<span id=100 class=\"silly\">" ("span" asOpenTagWithAttributes:'(id: 100 class:"silly"))))
    
    (- (id) testAttributesWithSelfClosingTags is
        (assert_equal "<meta http-equiv=\"content-type\" content=\"text-html; charset=utf-8\" />" 
            ("meta" asSelfClosingTagWithAttributes:'(http-equiv:"content-type" content:"text-html; charset=utf-8")))
        (assert_equal "<link media=\"all\" href=\"/stylesheets/nu.css\" type=\"text/css\" rel=\"stylesheet\" />"
            ("link" asSelfClosingTagWithAttributes:'(media:"all" href:"/stylesheets/nu.css" type:"text/css" rel:"stylesheet")))))