(define (reverse list)
    (reverse-core list '())    
)
(define (reverse-core list relist)
    (if (null? list)
        relist
        (reverse-core (cdr list) (cons  (car list) relist))
    ) 
)

(define (main)
    (reverse (list 1 4 9 16 25)))