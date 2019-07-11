; 正则序
; 因为后于 if 语句执行 所以抛出 0

; 应用序
; 因为先于 if 语句执行 所以(p)进入死循环

(define (p) (p)) 
(define (test x y)
    (if (= x 0)
        0
        y
    )    
)