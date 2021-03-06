(define zero
  (lambda (f) 
    (lambda (x) x)
  ))

(define (add-1 n)
  (lambda (f) 
    (lambda (x) 
        (f ((n f) x))
    )
  ))

; (add-1 zero)
; (add-1 zero)
; (add-1 (lambda (f) 
;     (lambda (x) x)
;   ))

; ((lambda (n) 
;     (lambda (f) 
;     (lambda (x) 
;         (f ((n f) x))
;     )
;   )
;  )
;  (lambda (f) 
;     (lambda (x) x)
;   )
; )

; ((lambda (f) 
;     (lambda (x) 
;         (f x)
;     )
; ))
(define one
    (lambda (f) 
        (lambda (x) 
            (f x)
        )
    )   
)

;(add-1 one)
; (add-1 one)
; (add-1 (lambda (f) 
;         (lambda (x) 
;             (f x)
;         )
;     ))
; ((lambda (f) 
;     (lambda (x) 
;         (f (f x))
;     )
; ))


(define two
    (lambda (f) 
        (lambda (x) 
            (f (f x))
        )
    )   
)
(define three
    (lambda (f) 
        (lambda (x) 
            (f (f (f x)))
        )
    )   
)


(define (sum num1 num2)
    (lambda (f) 
        (lambda (f2) 
     ((num1 f)
            ((num2 f) f2))
        )
    )
)
(define (mul num1 num2)
    (lambda (f) 
        (num1 (num2 f))
    )
)
(define (power num1 num2)
        (num1 num2)
)

;(sum 1 2)
; (lambda (f) 
    ; (lambda (f) 
        ; (lambda (x) 
        ;     (f x)
        ; )
    ; )

    ; (lambda (f) 
    ;     (lambda (x) 
            ; (f (f x))
    ;     )
    ; ) 
; )

(define (init NUM)
    ((NUM (lambda (x) (+ 1 x)) ) 0)
)


(define (main)
    (display (init (sum three three)))
    (newline)
    (display (init (power three three)))
    (newline)
    (display (init (mul three three)))
)