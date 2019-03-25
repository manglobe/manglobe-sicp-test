(define sqrt-3 
    (lambda (x) (sqrt-3-core 1.0 x))
)
(define sqrt-3-core
    (lambda (guess x)
        (if (good-enough? guess (improve guess x))
            guess
            (sqrt-3-core (improve guess x) x)
        )
    )
)

(define improve 
    (lambda (y x) 
        (/ 
            (+
                (/ x (* y y))
                (* 2 y)
            )
            3
        )
    )
)
(define good-enough? 
    (lambda (guess next-guess) 
        (> 0.001 
            (abs (/ (- next-guess guess) guess))
        )
    )
)