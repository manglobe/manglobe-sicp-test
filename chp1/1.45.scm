;fixed-point
;average-damp
(load "./1.36.scm")
;repeated
(load "./1.43.scm")


(define (get-n-root number n guess)
    (define (fn y)
        (/ number (expt y (- n 1)))
    )
    (fixed-point ((repeated average-damp (floor (log n 2))) fn) guess)
)

(define (main)
    (get-n-root 8 13 1.1)
)