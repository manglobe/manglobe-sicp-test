(define (deep-reverse list)
    (if (not (pair? list))
    list
    (deep-reverse-iter list '()))
)
(define (deep-reverse-iter list result)
    (if (null? list)
        result
        (deep-reverse-iter (cdr list) (cons (deep-reverse (car list)) result)))
  )

(define (main)
    (deep-reverse (list (list 1 2) (list 3 (list 5 6 7 8 (list 9 10 11) 12 13))))
)