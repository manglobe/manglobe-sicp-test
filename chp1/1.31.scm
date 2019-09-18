; (a)
(define (product function min max)
  (define (iter a result)
    (if (> a max)
        result
      (iter (+ a 1) (+ (function a) result))
    )
  )
  (iter min 0)
)

; (b)

(define (product function min max)
    (if (> min max)
        0
        (+  (function min)
            (product function (+ min 1) max)
        )
    )
)