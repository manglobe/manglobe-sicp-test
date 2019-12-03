(define (iterative-improve good-enough? improve)
    (lambda (x) 
      (define (try guess)
        (let ((next (improve guess)))
            (if (good-enough? guess next)
                next
                (try next)
            )
        )
      )
      (try x)
    )
)


(define tolerance 0.000001)

;fixed-point
(define (fixed-point f first-guess)
    (define (closs-enough? v1 v2)
        (< (abs (- v1 v2)) 
            tolerance
        )
    )
    (define (improve guess)
        (f guess)
    )
    ((iterative-improve closs-enough? improve) first-guess)
)

(define (func x)
    (/ (log 1000) (log x))
)
(define (main) (fixed-point func 2))

(define tolerance2 0.000001)
;sqrt
(define (sqrt x)
    (define (closs-enough? v1 v2)
        (< (abs (- v1 v2)) 
            tolerance2
        )
    )
    (define (improve guess)
        (/ (+ guess (/ x guess)) 2)
    )
    ((iterative-improve closs-enough? improve) 1.0)
)

(define (main2) (sqrt 2))
