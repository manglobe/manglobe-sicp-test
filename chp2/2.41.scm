(load "2.40.scm")

(define (add-next-num pairs)
(let ([min (car paris)])
    body)
    (accumulate append '() seq)
)
(define (unique-pairs n)
    (flatmap 
        (lambda (x) 
            (flatmap 
                (lambda (y) 
                    (map (lambda (z) (list x y z))
                        (enumerate-interval 1 (- y 1))
                    )
                ) 
                (enumerate-interval 1 (- x 1))
            )
        )
        (enumerate-interval 1 n)
    )
)
(define (list-sum list)
    (accumulate + 0 list)
)
(define (filter-sum-pairs sum seqs)
    (filter
        (lambda (n) (eq? sum (list-sum n)))
        seqs
    )
)

(define (make-pairs n s)
    (filter-sum-pairs s (unique-pairs n))
)

(define (main)
    (make-pairs 7 11)
)