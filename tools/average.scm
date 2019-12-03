
(define (sum-list list)
    (reduce + 0 list)
)
(define (average . args)
    (/ (sum-list args) (length args))
)