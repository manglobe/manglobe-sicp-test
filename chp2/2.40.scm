(load "../chp1/1.22.scm")
(load "2.37.scm")
(define (enumerate-interval low high)
    (if (> low high)
        '()
        (cons low (enumerate-interval (+ low 1) high))
    )
)
(define (flatmap proc seq)
    (accumulate append '() (map proc seq))
)


(define (unique-pairs n)
    (flatmap 
        (lambda (x) (map (lambda (y) (list x y)) 
                    (enumerate-interval 1 (- x 1))))
        (enumerate-interval 1 n)
    )
)
(define (make-pair-sum pair)
    (list (car pair) (cadr pair) (+ (car pair) (cadr pair)))
)

(define (prime-sum-pairs n)
    (filter (lambda (y) (prime? (caddr y))) 
        (map 
            (lambda (x) (make-pair-sum x))
            (unique-pairs n)
        )
    )
)
; (define (make-sequence n )
;     (define (make-sequence-core n result)
;         (if (eq? n 0)
;             result
;             (make-sequence-core (- n 1) (cons n result))
;         )
;       )
;   (make-sequence-core n '())
; )
; (define (unique-pairs n)
;     (let ([seq (make-sequence n)] [result '()])
;         (for-each 
;             (lambda (x) 
;                 (set! result 
;                     (append result 
;                         (map (lambda (y) (list x y)) (make-sequence (- x 1)))
;                     )
;                 ) 
;             ) 
;         seq)    
;         result
;     )
; )

(define (main)
    (prime-sum-pairs 7)
)