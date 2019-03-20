(define get-max2-sum-of-squares 
  (lambda (x y z) 
    (sum-of-squares-cons  (get-max2-from-3 x y z))
  )
)
(define square 
  (lambda (x) (* x x))
)
(define sum-of-squares-cons 
  (lambda (my-cons)
    (+ 
      (square (car my-cons)) 
      (square (car (cdr my-cons)) )
    )
  )
)

(define get-bigger 
  (lambda (x y)
    (if (> x y) 
      x 
      y
    )
  )
)
(define get-smaller
  (lambda (x y)
    (if (< x y) 
      x 
      y
    )
  )
)
(define get-max2-from-3
  (lambda (x y z)
    (list  (get-bigger x y)  (get-bigger (get-smaller x y) z))
  )
)
 
; main test
(define main 
  (eqv? (get-max2-sum-of-squares 3 1 4) 25)
)