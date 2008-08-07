(load "nom:nom")

(class TestParsing is NuTestCase
    (imethod (id) testSyntaxRecognition is
        (set @validfirst '(p style "foo" "Bar"))
        (set @validsecond '())
        ))