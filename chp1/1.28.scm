
(load "1.27.scm")

(define (non-trivial-sqrt? a n)
    (if (and
            (not (= a n) )
            (not (= a (- n 1))) 
            (mod (square a) n)
        )
        #t
        #f
    )
)


(define (expmod base exp m)
    (cond 
        ((= exp 0) 1)
        ((non-trivial-sqrt? base m) 0)
        ((even? exp) 
            (mod 
                (square (expmod base (/ exp 2) m))
                m
            )
        )
        (else (mod 
            (* base (expmod base (- exp 1) m))
            m
        ))
    )
)