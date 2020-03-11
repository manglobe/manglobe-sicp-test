(define (square-list1 items)
    (if (null? items)
        '()
        (cons (* (car items) (car items)) (square-list1 (cdr items)))
    )    
)

(define (square-list2 items)
    (map (lambda (num) (* num num)) items)    
)

(define (main)
    (display (square-list1 (list 1 2 3 4 5)))
    (display (square-list2 (list 1 2 3 4 5)))
)