(define (same-parity . list)
    (same-parity-core list '() (odd? (car list)))    
)
(define (same-parity-core list relist is-odd)
    (if (null? list)
        relist
        (if (eq? is-odd (odd? (car list)))
            (same-parity-core (cdr list) (append relist (cons (car list) '())) is-odd)
            (same-parity-core (cdr list) relist is-odd)
        )
    )
)

(define (main)
    (same-parity 2 3 5 6 7 9)
)