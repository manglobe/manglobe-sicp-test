(load "1.22.scm")

(define (square n)
    (* n n)
)
(define (expmod base exp m)
    (cond 
        ((= exp 0) 1)
        ((even? exp) 
            (remainder 
                (square (expmod base (/ exp 2) m))
                m
            )
        )
        (else (remainder 
            (* base (expmod base (- exp 1) m))
            m
        ))

    )
)

(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a)
    )
    (try-it (+ 
        1 
        (random (- n 1))
    ))
)

(define (check-fermat n)
    (display 
        (string-append "fetmart-test is " 
            (if (fermat-test n)
                "true"
                "false"
            )
        )
    )
    
    (display 
        (string-append "  real is " 
            (if (prime? n)
                "true"
                "false"
            )
        )
    )
)

(define (main)
    (check-fermat 561)    
    (newline)
    (check-fermat 1105)    
    (newline)
    (check-fermat 1729)    
    (newline)
    (check-fermat 2465)    
    (newline)
    (check-fermat 2821)    
    (newline)
    (check-fermat 6601)    
    (newline)
    
)