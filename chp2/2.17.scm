(define (last-pair list)
    (let ([cdrlist (cdr list)])
        (if (null? cdrlist)
            list
            (last-pair cdrlist)
        )
    ) 
)

(define (main)
    (last-pair (list 23 72 149 34))
)