(load "2.7.scm")
(define (mul-interval z1 z2)
  (let ([p1 (* (lower-bound z1) (lower-bound z2))]
    [p2 (* (lower-bound z1) (upper-bound z2))]
    [p3 (* (upper-bound z1) (lower-bound z2))]
    [p4 (* (upper-bound z1) (upper-bound z2))]
  )
  (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))
  )
)
(define (db-positive? a b)
  (and (> a 0) (> b 0)))
(define (db-negative? a b)
  (and (< a 0) (< b 0)))
(define (contain-zero? a b)
  (and (< a 0) (> b 0))
)
(define (mul-interval-new z1 z2)
  (let ([a  (lower-bound z1)]
    [b  (upper-bound z1)]
    [c  (lower-bound z2)]
    [d  (upper-bound z2)]
  )
    (cond
      ((and (db-positive? a b) (db-positive? c d)) (make-interval (* a c) (* b d)))
      ((and (db-positive? a b) (db-negative? c d)) (make-interval (* b d) (* a c)))
      ((and (db-negative? a b) (db-positive? c d)) (make-interval (* b d) (* a c)))
      ((and (db-negative? a b) (db-negative? c d)) (make-interval (* a c) (* b d)))

      ((and (contain-zero? a b) (db-positive? c d)) (make-interval (* a d) (* b d)))
      ((and (contain-zero? a b) (db-negative? c d)) (make-interval (* b c) (* a c)))
      ((and (db-positive? a b) (contain-zero? c d)) (make-interval (* b d) (* b c)))
      ((and (db-negative? a b) (contain-zero? c d)) (make-interval (* a d) (* a c)))
      ((and (contain-zero? a b) (contain-zero? c d)) (make-interval (min (* a d) (* b c)) (max (* a c) (* b d))))
    )
  )
)

(define (main)
    (mul-interval-new (make-interval -2 10)  (make-interval -5 6))
)