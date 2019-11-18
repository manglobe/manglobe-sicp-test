(load "./1.42.scm")
(define (repeated fn count)
    (if (= count 1)
        fn
        (repeated (compose fn fn ) (- count 1))
    )
)

(define (main)
    ((repeated square 2) 5)
)