(load "nom")

(class TestExtensions is NuTestCase
    (imethod (id) testContainsObject is
        (set list '(1 2 3 4 5))
        (assert_true (list containsObject:1))
        (assert_true (list containsObject:5))
        (assert_false (list containsObject:6))
        (assert_false (list containsObject:"OM NOM NOM NOM")))
        
        
        
)