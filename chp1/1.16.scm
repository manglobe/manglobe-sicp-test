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