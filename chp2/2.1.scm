(define (isPositive n d) 
    (or (and (< n 0) (< d 0))
        (and (> n 0) (> d 0))
    )
)
(define (make-rate n d)
    (let ([abs-n (abs n)] [abs-d (abs d)])
        (if (isPositive n d) 
            (cons abs-n abs-d)
            (cons (- abs-n) abs-d)
        )
    )
)
(define (main)
    (make-rate 2 -4)
)