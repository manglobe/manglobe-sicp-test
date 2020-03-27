(define (union-set set1 set2)
    (cond 
        ((null? set1) set2)
        ((null? set2) set1)
        (else (let ([item1 (car set1)] [item2 (car set2)] [others1 (cdr set1)] [others2 (cdr set2)])
            (cond
                ((= item1 item2) (cons item2 (union-set others1 others2)))
                ((> item1 item2) (cons item2 (union-set set1 others2)))
                ((< item1 item2) (cons item1 (union-set others1 set2)))
            )
        ))
    )    
)


(define (main)
    (union-set '(1 8 9 11 13) '(1 2 3 4 6 7 8 9))
)