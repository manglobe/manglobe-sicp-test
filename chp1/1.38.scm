(load "1.37.scm")
(define (rule i)
    (if (= 2 (mod i 3))
        (+ 2 (* 2 (div i 3)))
        1
    )
)

(define (main)
  (cont-frac (lambda (i) 1.0) rule 11))
