(define (reduce fn first list)
    (let loop((lost list) (res first))
        (if  (eq? lost '())
            res
            (loop (cdr lost) (reduce-core fn res (car lost)))
        )
    )
)

(define (reduce-core fn prev-result current) 
    (fn prev-result current)
)