(define (some fn list)
    (if (null? list)
        #f
        (if (fn (car list))
            #t
            (some fn (cdr list))
        )   
    )
)