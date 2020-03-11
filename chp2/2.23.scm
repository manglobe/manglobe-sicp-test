(define (for-each func list)
    (if (not (null? list))
        ((lambda () 
            (func (car list))
            (for-each func (cdr list))
        ))
    )    
)

(define (main)
    (for-each (lambda (x) (newline) (display x)) (list 1 10 101))
)