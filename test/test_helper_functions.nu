(load "nom:nom")

(class TestHelperFunctions is NuTestCase
    (imethod (id) testEscape is
        (assert_equal (escape "foo & 'bar'") "foo &amp; &apos;bar&apos;")))