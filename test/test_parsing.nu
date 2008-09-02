(load "nom:nom")

(class TestParsing is NuTestCase
    (imethod (id) testSyntaxRecognition is
        (set validfirst '(p (style: "foo") "Bar" "Baz" "Baf"))
        (set validsecond '(br))
        (set validthird '(hr (style: "enormous")))
        (set validfourth '(blockquote "this is just a bunch of text and stuff" "see? not too difficult."))
        (set validfifth (head (title "just some samples") (meta (http-equiv: "Content-Type" content:"text-html"))))
        (set allvalids (list 'html validfifth (list 'body validfirst validsecond validthird validfourth)))
        (set inv1 '("hello" "this is invalid"))
        (set inv2 '(1 2 3 4 5 6 7 8))
        (set inv3 12738278)
        
        (assert_equal (valid-syntax? validfirst) YES)
        (assert_equal (valid-syntax? validsecond) YES)
        (assert_equal (valid-syntax? validthird) YES)
        (assert_equal (valid-syntax? validfourth) YES)
        (assert_equal (valid-syntax? validfifth) YES)
        (assert_equal (valid-syntax? allvalids) YES)
        
        (assert_equal (valid-syntax? inv1) NO)
        (assert_equal (valid-syntax? inv2) NO)
        (assert_equal (valid-syntax? inv3) NO)))