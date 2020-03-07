(load "2.10.scm")
(load "2.11.scm")
(define (part1 r1 r2)
    (div-interval 
        (mul-interval r1 r2)
        (add-interval r1 r2)
    )
)
(define (part2 r1 r2)   
    (let ([one (make-interval 1 1)])
        (div-interval one 
            (add-interval 
                (div-interval one r1)
                (div-interval one r2)
            )    
        )
    )
)

(define (main)
    (let ([r1 (make-interval 1 3)] [r2 (make-interval 1 4)])
        (display "part1")  
        (display (part1 r1 r2))  
        (newline)
        (display "part2")   
        (display (part2 r1 r2))   
    )
)
(define (main2)
    (let ([r1 (make-interval 1000000 1000005)] [r2 (make-interval 2000000 2000005)])
        (display "part1")  
        (display (part1 r1 r2))  
        (newline)
        (display "part2")   
        (display (part2 r1 r2))   
    )
)

; reason: unpure
; (R1*R2)/(R1+R2) 
; (if (R1,R2 ∈ R+))
; (interval (R1*R2)) => (cons (* (min R1) (min R2)) (* (max R1) (max R2)))
; (interval (R1 + R2)) => (cons (+ (min R1) (min R2)) (+ (max R1) (max R2)))
; (interval (R1*R2)/(R1+R2) ) => (cons (min (R1*R2)/(R1+R2)) (max (R1*R2)/(R1+R2)))
; (min (R1*R2)/(R1+R2)) => (/ (min (R1*R2)) (max (R1+R2)))
; (!= R1 R1')