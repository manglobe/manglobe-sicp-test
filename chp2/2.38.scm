(load "2.37.scm")
(define (fold-right op initial sequence)
    (accumulate op initial sequence)
)
(define (fold-left op initial sequence)
    (define (iter result rest)
        (if (null? rest)
            result
            (iter (op result (car rest)) 
                (cdr rest)
            )
        )
    )
    (iter initial sequence)
)

(define (diff-test)
    (display "</ 1 (list 1 2 3)>")
    (newline)
    (display "fold-right: ")
    (display (fold-right / 1 (list 1 2 3)))
    (newline)
    (display "fold-left: ")
    (display (fold-left / 1 (list 1 2 3)))
    (newline)
    (newline)
    (display "<list '() (list 1 2 3)>")
    (newline)
    (display "fold-right: ")
    (display (fold-right list '() (list 1 2 3)))
    (newline)
    (display "fold-left: ")
    (display (fold-left list '() (list 1 2 3)))
    (newline)
)

; if has <op0> make any <initial> <'(x1 x2 ... xn)> that (eq (flod-left op initial sequence) (flod-right op initial sequence))
; (eq [(op0 (op0 initial x1) x2))] [(op0 (op0 initial x2) x1))])
; op0 is associative 