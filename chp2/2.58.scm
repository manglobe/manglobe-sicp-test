(load "2.27.scm")
(define (sum? exp)
    (and (pair? exp) (eq? '+ (cadr exp)))
)
(define (product? exp)
    (and (pair? exp) (eq? '* (cadr exp)))    
)
(define (addend exp)
    (car exp)
)
(define (augend exp)
    (if (null? (cdddr exp))
        (caddr exp)
        (cddr exp)
    )
)

(define (multiplier exp)
    (car exp)
)
(define (multiplicand exp)
    (if (null? (cdddr exp))
        (caddr exp)
        (cddr exp)
    )
)

(define (make-sum x y)
    (cond
        ((=number? 0 x) y)
        ((=number? 0 y) x)
        ((and (number? x) (number? y)) (+ x y))
        (else (list x '+  y) )   
    )
)
(define (make-product x y)
    (cond
        ((or (=number? 0 x) (=number? 0 y)) 0)
        ((=number? 1 x) y)
        ((=number? 1 y) x)
        ((and (number? x) (number? y)) (* x y))
        (else (list x '* y) )   
    )
)

(define (main)
    (display (deriv '(x + 3) 'x))
    (newline)
    (display (deriv '(x * y) 'x))
    (newline)
    (display (deriv '((x * y) * (x + 3)) 'x))
    (newline)
    (display (deriv '(x + (3 * (x + y + 2))) 'x))
    (newline)
)

; b) 涉及到计算顺序 需要修改 deriv 函数， 或对数据进行预处理