(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
            (sum term (next a) next b)
        )
    )
)
(define (get-times index n)
    (cond
        ((= index 0) 1)
        ((= index n) 1)
        ((odd? index) 4)
        (else  2)
    )
)

(define (simpson-rule fn a b n)
    (define h (/ (- b a) n))
    (define (y k)
        (fn (+ a (* h k)))
    )
    (define (next-item k)
        (* (y k) (get-times k n))
    )
    (simpson-rule-core h (sum next-item 0 (lambda (n) (+ n 1)) n))
)

(define (simpson-rule-core h sumed)
    (* 
        (/ h 3)
        sumed
    )
)

(define (main)
    (simpson-rule cube 0 1 1000)
    ; (simpson-rule cube 0 1 1000)
)

(define (cube x)
    (* x x x)
)