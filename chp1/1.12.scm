(define (pascal-iter x y)
    (cond
        ((or (> 0 x) (> 0 y) ) (error "x or y should't less than 0"))
        ((> y x) (error "y should't bigger than x"))
        ((or (= 0 y) (= x y) ) 1)
        (else (+ (pascal-iter (- x 1) (- y 1)) (pascal-iter (- x 1) y)))
    )
)