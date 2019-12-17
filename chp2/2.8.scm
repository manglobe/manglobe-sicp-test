(load "./2.7.scm")
(define (sub-interval z1 z2)
    (make-interval (- (lower-bound z1) (upper-bound z2)) (- (upper-bound z1) (lower-bound z2)))
)

(define (main)
    (sub-interval (make-interval 2 13) (make-interval 11 33))
)