; 1.16
(define (expt num n)
    (expt-loop num n 1)    
)
(define (expt-loop num n res)
    (cond 
        ((= 0 n) res)
        ((even? n) (expt-loop (square num) (/ n 2) res) )
        (else   (expt-loop num (- n 1) (* num res)  ))
    )    
)
(define (square num)
    (* num num)    
)
;1.17
(define (double arguments)
    (* arguments 2)
)
(define (halve arguments)
    (/ arguments 2)
)



(define (times a b)
    (times-loop a b 0)
)
(define (times-loop a b res)
    (cond
        ((or (= 0 a) (= 0 b)) res)
        ((even? a) (times-loop (halve a) (double b) res))
        ((odd? a) (times-loop (- a 1) b (+ res b)))
    )    
)