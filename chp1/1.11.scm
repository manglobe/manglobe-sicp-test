(define (func-iter n)
    (cond 
        ((< n 3) n)
        (else 
            (+
                (* 1 (func-iter (- n 1)))
                (* 2 (func-iter (- n 2)))
                (* 3 (func-iter (- n 3)))
            )
        )
    )
)


(define (func n)
    (if (< n 3) 
        n
        (func-loop 0 1 2 n)
    )
)

(define (func-loop a b c n)
    (if (< n 3) 
        c
        (func-loop b c (+ (* 3 a) (* 2 b) c) (- n 1))
    )

)
