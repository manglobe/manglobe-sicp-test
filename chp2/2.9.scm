(load "2.8.scm")
(define (get-width z)
  (/ (- (upper-bound z) (lower-bound z)) 2)
)
(define (add-interval z1 z2)
    (make-interval (+ (lower-bound z1)  (lower-bound z2))
        (+ (upper-bound z1)  (upper-bound z2))
    )
)
(define (mul-interval z1 z2)
  (let ([p1 (* (lower-bound z1) (lower-bound z2))]
    [p2 (* (lower-bound z1) (upper-bound z2))]
    [p3 (* (upper-bound z1) (lower-bound z2))]
    [p4 (* (upper-bound z1) (upper-bound z2))]
  )
  (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))
  )
)
(define (get-sum-width z1 z2)
    (get-width (add-interval z1 z2))
)

(define (get-width-sum z1 z2)
    (+ (get-width z1) (get-width z2))
)

(define (get-mul-width z1 z2)
    (get-width (mul-interval z1 z2))
)

(define (get-width-mul z1 z2)
    (* (get-width z1) (get-width z2))
)


; (get-sum-width z1 z2)
(get-width (add-interval z1 z2))
(get-width (make-interval (+ (lower-bound z1)  (lower-bound z2))
        (+ (upper-bound z1)  (upper-bound z2))
    ))
(/ (- (upper-bound (make-interval (+ (lower-bound z1)  (lower-bound z2))
        (+ (upper-bound z1)  (upper-bound z2))
    )) 
    (lower-bound (make-interval (+ (lower-bound z1)  (lower-bound z2))
        (+ (upper-bound z1)  (upper-bound z2))
    ))) 
    2)
(/ (- (+ (upper-bound z1)  (upper-bound z2))
    (+ (lower-bound z1)  (lower-bound z2))) 
    2)
(/ (+ (- (upper-bound z1)  (lower-bound z1))
    (- (upper-bound z2) (lower-bound z2))) 
    2)
(+ (/ (- (upper-bound z1) (lower-bound z1)) 2)
   (/ (- (upper-bound z2) (lower-bound z2)) 2)
) 
(+ (/ (- (upper-bound z1) (lower-bound z1)) 2)
   (/ (- (upper-bound z2) (lower-bound z2)) 2)
) 
(+ (get-width z1) (get-width z2))
(get-width-sum z1 z2)


;(get-mul-width z1 z2)
(get-width (mul-interval z1 z2))
(get-width (let ([p1 (* (lower-bound z1) (lower-bound z2))]
    [p2 (* (lower-bound z1) (upper-bound z2))]
    [p3 (* (upper-bound z1) (lower-bound z2))]
    [p4 (* (upper-bound z1) (upper-bound z2))]
  )
  (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))
  ))

(/ (- (max p1 p2 p3 p4) (min p1 p2 p3 p4)) 2)

;(get-width-mulz1 z2)
    (* (/ (- (upper-bound z1) (lower-bound z1)) 2) (/ (- (upper-bound z2) (lower-bound z2)) 2))
(/
    (* (- (upper-bound z1) (lower-bound z1)) (- (upper-bound z2) (lower-bound z2)))
    4
)

;(if (eq get-width-mul get-mul-width))

(eq (/ (- (max p1 p2 p3 p4) (min p1 p2 p3 p4)) 2) (/
    (* (- (upper-bound z1) (lower-bound z1)) (- (upper-bound z2) (lower-bound z2)))
    4
))
(eq (- (max p1 p2 p3 p4) (min p1 p2 p3 p4)) (/
    (* (- (upper-bound z1) (lower-bound z1)) (- (upper-bound z2) (lower-bound z2)))
    2
))
;(if (z ∈ N))
(eq (- (* (upper-bound z1) (upper-bound z2))  (* (lower-bound z1) (lower-bound z2))) 
    (/
        (* (- (upper-bound z1) (lower-bound z1)) (- (upper-bound z2) (lower-bound z2)))
        2
    )
)
(eq (- (* (upper-bound z1) (upper-bound z2))  (* (lower-bound z1) (lower-bound z2))) 
    (/
       (- (+
            (* (upper-bound z1) (upper-bound z2)) 
            (* (lower-bound z1) (lower-bound z2)) 
        )
        (+
            (* (upper-bound z1) (lower-bound z2) )
            (* (lower-bound z1) (upper-bound z2) )
        )
        )
            
        2
    )
)
(eq (- (* a c) (* b d))
    (/  (-
            (+ (* a c) (* b d))
            (+ (* a d) (* b c))
        )
        2
    )
)
(eq (* b d 3)
    (+ (* a d) (* a c) (* b c))
)
; ∴ (not (eq get-width-mul get-mul-width))