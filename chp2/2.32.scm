(define (subset s)
    (if (null? s)
        (list '())
        (let ([rest (subset (cdr s))])
            (append rest 
                (map
                    (lambda (sub-s) 
                        (cons (car s) sub-s)
                    ) 
                    rest
                )
            )    
        )

    )    
)

(define (main)
    (subset (list 1 2 3))    
)