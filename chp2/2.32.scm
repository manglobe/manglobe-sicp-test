(define (subset s)
    (if (null? s)
        (list '())
        (let ([rest (subset (cdr s))])
            (append rest 
                (map
                    (lambda (sub-s) 
                        (cond
                            ((null? sub-s) (list (car s)))
                            ((pair? sub-s) (cons (car s) sub-s))
                            (else list sub-s (car s))
                        )
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