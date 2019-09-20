(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (closs-enough? v1 v2)
    (< (abs (- v1 v2)) 
        tolerance
    )
  )
  (define (try guess)
    (let ((next (f guess)))
        (if (closs-enough? guess next)
            next
            (try next)
        )
    )
  )
  (try first-guess)
)

(define (func x)
    (+ 1 (/ 1 x))
)
(define (main) (fixed-point func 1))