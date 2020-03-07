(load "2.14.scm")

(define (preset-interval r1 r2)
    (lambda (func)
        (let ([p1 (cons (car r1) (car r2))] [p2 (cons (car r1) (cdr r2))] [p3 (cons (cdr r1) (car r2))] [p4 (cons (cdr r1) (cdr r2))])
            (cons (min (func (car p1) (cdr p1)) (func (car p2) (cdr p2)) (func (car p3) (cdr p3)) (func (car p4) (cdr p4)))
                (max (func (car p1) (cdr p1)) (func (car p2) (cdr p2)) (func (car p3) (cdr p3)) (func (car p4) (cdr p4)))
            )
        )
    )    
)
(define (part1 r1 r2)
    (/ 
        (* r1 r2)
        (+ r1 r2)
    )
)
(define (part2 r1 r2)   
    (/ 1 
        (+
            (/ 1 r1)
            (/ 1 r2)
        )    
    )
)
(define (main)
    (let ([r1 (make-interval 1 3)] [r2 (make-interval 1 4)])
        (display "part1")  
        (display ((preset-interval r1 r2) part1))  
        (newline)
        (display "part2")   
        (display ((preset-interval r1 r2) part2))   
    )
)