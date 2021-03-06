; (list 'a 'b 'c) => (a b c)
; (list (list 'george)) => ((george))
; (cdr '((x1 x2) (y1 y2))) => ((y1 y2))
; (cadr '((x1 x2) (y1 y2))) => (y1 y2)
; (pair? (car '(a short list))) => #f
; (memq 'red '((red shoes) (blue shoes)) => #f
; (memq 'red '(red shoes blue shoes) => (red shoes blue shoes)

(define (memq item x)
    (cond
      ((null? x) #f)
      ((eq? item (car x)) x)
      (else (memq item (cdr x)))
    )
)
(define (main)
    (display "(list 'a 'b 'c) => (a b c)" )
    (newline)
    (display   (list 'a 'b 'c))
    (newline)
    (display "=====================================")
    (newline)
    (display "(list (list 'george)) => ((george))" )
    (newline)
    (display   (list (list 'george)))
    (newline)
    (display "=====================================")
    (newline)
    (display "(cdr '((x1 x2) (y1 y2))) => ((y1 y2))" )
    (newline)
    (display   (cdr '((x1 x2) (y1 y2))))
    (newline)
    (display "=====================================")
    (newline)
    (display "(cadr '((x1 x2) (y1 y2))) => (y1 y2)" )
    (newline)
    (display   (cadr '((x1 x2) (y1 y2))))
    (newline)
    (display "=====================================")
    (newline)
    (display "(pair? (car '(a short list))) => #f" )
    (newline)
    (display   (pair? (car '(a short list))))
    (newline)
    (display "=====================================")
    (newline)
    (display "(memq 'red '((red shoes) (blue shoes)) => #f" )
    (newline)
    (display   (memq 'red '((red shoes) (blue shoes))))
    (newline)
    (display "=====================================")
    (newline)
    (display "(memq 'red '(red shoes blue shoes) => (red shoes blue shoes)" )
    (newline)
    (display   (memq 'red '(red shoes blue shoes)))
    (newline)
    (display "=====================================")
    (newline)
)