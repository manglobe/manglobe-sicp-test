(define (make-interval x y)
  (cons x y))
  
(define (lower-bound z)
  (car z))
(define (upper-bound z)
  (cdr z))
