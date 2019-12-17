(define (make-center-percent center percent)
    (cons (- center (* center percent)) (+ center (* center percent)))
)

(define (percent z)
  (let ([x (car z)] [y (cdr z)] [center (/ (+ (car z) (cdr z)) 2)])
    (/ (- center x) center)
  )
)

(define (main)
    (percent (make-center-percent 12 0.5))
)