(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence))
        )
    )
)


(define (map p sequence)
    (accumulate (lambda (x y) (cons (p x) y)) '() sequence)
)

(define (append seq1 seq2)
    (accumulate cons seq2 seq1)
)

(define (length sequence)
    (accumulate (lambda (x y) (+ 1 y)) 0 sequence)
)
(define seq1 (list 1 2 3 4))
(define seq2 (list 6 7 8 9))
(define (main)
    (display "map:")
    (display (map (lambda (x) (* x x)) seq2))
    (newline)
    (display "append:")
    (display (append seq1 seq2))
    (newline)
    (display "length:")
    (display (length seq1))
)