(define (cont-frac n d k)
    (define (cont-frac-rec x)
        (if (= x k)
            (/ (n x) (d x))
            (/ (n x) (+ (d x) (cont-frac-rec (+ x 1))))
        )
    )
    (cont-frac-rec 1)
)



(define (main )
  (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11))


(define (cont-frac-iter n d k)
    (define (iter x res)
        (if (= x 1)
            res
            (iter (- x 1)
                (/ (n x) (+ (d x) res))
            )   
        )
    )
    (iter (- k 1) (/ (n k) (d k)))
)



(define (main2 )
  (cont-frac-iter  (lambda (i) 1.0) (lambda (i) 1.0) 10))
