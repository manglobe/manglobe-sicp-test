; less memo
(define (union-set set1 set2)
    (cond
      ((null? set1) set2)
      ((element-of-set? (car set1) set2) (union-set (cdr set1) (cons (car set1) set2)))
      (else (union-set (cdr set1) set2))
    )
)
; most fast
(define (union-set set1 set2)
    (union-set-core set1 set2 set2)
)
(define (union-set-core set1 set2 result)
    (cond
      ((null? set1) result)
      ((element-of-set? (car set1) set2) (union-set (cdr set1) set2  (cons (car set1) result)))
      (else (union-set (cdr set1) set2 result))
    )
)