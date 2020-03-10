
(define (fn1 list)
    (car (cdr (car (cdr (cdr list)))))
)
(define (fn2 list)
    (car (car list))
)
(define (fn3 list)
    (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr list))))))))))))
)


(define (main)
    (display (fn1 '(1 3 (5 7) 9)) )
    (display (fn2 '((7))) )
    (display (fn3 '(1 (2 (3 (4 (5 (6 7))))))) )
)