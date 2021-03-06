(define (split . splits)
    (lambda (painter) 
        (define (core fns result)
            (if (null? fns)
                result
                (core (cdr fns) ((car fns) result))
            )
        )
        (core splits painter)
    )
)