(load "./2.33.scm")
(define (horner-eval n list)
    (accumulate 
        (lambda (x y) 
            (+  x 
                (* n 
                   y
                )
            )
        ) 
        0 list
    )
)

; x=>1+3x+5x^3+x^5
(define (main)
  (horner-eval 2 (list 1 3 0 5 0 1))
)