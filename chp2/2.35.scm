(load "./2.33.scm")
(define (count-leave tree)
    (accumulate + 0 
        (map (lambda (sub-tree) 
            (cond 
                ((null? sub-tree) 0)
                ((pair? sub-tree) (count-leave sub-tree))
                (else 1)
            )
        )
        tree)
    )
)

(define x (cons (list 1 2) (list 3 4)))
(define (main)
  (display (count-leave x)) ;4
  (newline)
  (display (count-leave (list x x))) ;8
  (newline)
)