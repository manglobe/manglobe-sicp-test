(define sqrt-iter 
  (lambda (guess x)
    (if (good-enough? guess x)
	guess
	(sqrt-iter (improve guess x)
		   x
		   )
	)
    )
  )
(define improve 
  (lambda (guess x)
    (average guess (/ x guess))
    )
  )
(define average 
  (lambda (x y)
    (/ (+ x y) 2)
    )
  )
(define good-enough? 
  (lambda (guess x)
    (< (abs
	 (- (square guess) x))
       0.001)
    )
  )
(define square 
  (lambda (x)
   (* x x)
  )
)
; small
; (sqrt-iter 1 0.0000004) -> 0.03125 -> not good enough
; big
; (sqrt-iter 1 4444444444444444444444444444444444) -> spend long time


; change-enough

(define change-enough? 
  (lambda (guess0 guess1)
    (< 
      (abs 
        (- 1 
          (/ guess0 guess1)
        )
      )
      0.001
    )
  )
)

(define sqrt-iter-new
  (lambda (guess x)
    (if (change-enough? guess (improve guess x))
      (improve guess x)
      (sqrt-iter-new (improve guess x) x)
	  )
  )
)