(define (make-interval x y)
  (cons x y))

(define (upper-bound z)
  (car z))
  
(define (lower-bound z)
  (cdr z))