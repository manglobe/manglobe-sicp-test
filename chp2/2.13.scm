(load "2.9.scm")
(define (get-center interval)
    (/ (+ (lower-bound  interval) (upper-bound  interval) ) 2)
)
(define (P interval)
  (/ (get-error interval) (get-center interval)))
; set A as (create-interval x0 y0);
; set B as (create-interval x1 y1);
(define (get-product A B)
 (cons (* (lower-bound  A) (lower-bound  B) ) (* (upper-bound  A) (upper-bound  B) ))
)
(define (get-lower-error A B)
    (let ([center-product (* (get-center A) (get-center B))])
        (
            (/  (- center-product (lower-bound (get-product A B))) 
                center-product )
        ))
)
(define (get-upper-error A B)
    (let ([center-product (* (get-center A) (get-center B))])
        (
            (/ (- (upper-bound (get-product A B)) center-product) 
                center-product )
        ))
)
(define (get-error interval)
    (/ (- (upper-bound  interval) (lower-bound  interval) ) 2)
)
; flat
; get-lower-error
(/  (- center-product (* (lower-bound  A) (lower-bound  B) )) 
            center-product )
(- 1
    (/ (* (lower-bound  A) (lower-bound  B) ) center-product)
)
(- 1
    (/ (* (lower-bound  A) (lower-bound  B) ) 
       (* (get-center A) (get-center B))
    )
)
(- 1
    (* (/ (lower-bound  A) (get-center A) ) 
       (/ (lower-bound  B) (get-center B))
    )
)
;(get-center A) -> (+ (get-error A) (lower-bound A))
;(lower-bound A) -> (- (get-center A) (get-error A))


(- 1
    (* (/ (lower-bound  A) (+ (get-error A) (lower-bound A) ) 
       (/ (lower-bound  B) (+ (get-error B) (lower-bound B))
    )
)
(- 1
    (* (/ ( - (get-center A) (get-error A)) (get-center A) ) 
       (/ ( - (get-center B) (get-error B)) (get-center B))
    )
)
(- 1
    (* (- 1 (/ (get-error A) (get-center A)) ) 
        (- 1 (/ (get-error B) (get-center B)))
    )
)

(- 1
    (* (- 1  (P A) ) 
        (- 1 (P B))
    )
)
(- (+ (P A) (P B)) (* (P A) (P B)))

;(& (if (-> 0 (P A) ))  (if (-> 0 (P B) )))
;(= 0 (* (P A) (P B)))

;∴  (get-product A B) => (+ (P A) (P B))