(define (cc amount coin-values)
    (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else 
            (+ (cc amount (expect-first-denomination coin-values))
                (cc (- amount (first-denomination coin-values)) coin-values)
            )    
        )
    )
)
(define (no-more? list)
    (null? list)
)
(define (expect-first-denomination list)
    (cdr list)
)
(define (first-denomination list)
    (car list)
)
(define (main)
    (cc 100 (list 25 50 10 5 1))
)
;order of (coin-values) won't affect the result of cc