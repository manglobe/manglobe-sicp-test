(define tolerance 0.0001)

(define (fixed-point f first-guess)
  (define (closs-enough? v1 v2)
    (< (abs (- v1 v2)) 
        tolerance
    )
  )
  (define (try guess)
    (let ((next (f guess)))
        (display "guess:")
        (display guess)
        (display ", next:")
        (display next)
        (newline)
        (if (closs-enough? guess next)
            next
            (try next)
        )
    )
  )
  (try first-guess)
)

(define (func x)
    (/ (log 1000) (log x))
)
(define (main) (fixed-point func 2))

(define (average-damp f)
  (lambda (x)  (/ (+ x (f x)) 2))
)

(define (main2) (fixed-point (average-damp func) 2))
