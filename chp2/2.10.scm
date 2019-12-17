(load "2.9.scm")

(define (div-interval x y)
    (mul-interval x 
        (make-interval (/ 1.0 (upper-bound y))
             (/ 1.0 (lower-bound y))
        )
    )
)

(define (my-div n1 n2)
    (if (eq? n2 0)
        (error 'my-div  "error")
        (/ n1 n2)
    )
)
(define (my-div-interval x y)
    (mul-interval x 
    (make-interval (my-div 1.0 (upper-bound y))
            (my-div 1.0 (lower-bound y))
    )
))