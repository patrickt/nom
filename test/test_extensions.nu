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
        (assert_equal (l1 join) "1 2 3 4 5")
        (assert_equal (l2 join) "a b c d e")
        (assert_equal (l3 join) "psychology class is boring")
        (assert_equal (l4 join) "what happens with symbols")
        (assert_equal (l5 join) "one_element"))
        
)