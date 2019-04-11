(define (smallest-divisor n)
    (smallest-divisor-loop 2 n) 
)

(define (smallest-divisor-loop a n)
    (if (= (remainder n a) 0)
        a
        (smallest-divisor-loop (+ a 1) n)
    )
)

(define (main-test)
    (list 
        (smallest-divisor 199)
        (smallest-divisor 1999)
        (smallest-divisor 19999)
    )
)