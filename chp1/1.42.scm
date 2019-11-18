(load "./1.41.scm")
(define (compose f1 f2)
    (lambda (x) (f1 (f2 x)))
)
(define (square x)
    (* x x)
)
(define (main )
    ((compose square inc) 6)
)
