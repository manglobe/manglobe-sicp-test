(define (double f)
  (lambda (x) (f (f x)))
)
(define (inc x)
    (+ x 1)
)

(define (main)
  ((
    (double (double double)) 
    inc)
    5
  )
)