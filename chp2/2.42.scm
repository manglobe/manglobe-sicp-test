(load "2.40.scm")
(load "../tools/some.scm")
(define (queens board-size)
    (define (queen-cols k)
        (if (= 0 k)
            (list empty-board)
            (filter
                (lambda (positions) (safe? k positions))
                (flatmap 
                    (lambda (rest-of-queens) 
                        (map 
                            (lambda (new-row) 
                                (adjoin-position new-row k rest-of-queens)
                            )
                            (enumerate-interval 1 board-size)
                        )
                    )
                    (queen-cols (- k 1))
                )
            )
        )
    )
    (queen-cols board-size)
)
(define (adjoin-position row col positions)
    (if (null? positions)
        (list (list col row))
        (append positions (list (list  col  row )))
    )
)
(define empty-board '())
(define (safe? k positions)
    (let ([k-position (get-position k positions)] [others (filter (lambda (postion) (not (= k (car postion))) ) positions)])
        (and 
            (not (in-same-col? k-position others))
            (not (in-same-row? k-position others))
            (not (in-same-slope? k-position others))
        )
    )
)
(define (get-position n positions)
    (if (= n 1)
        (car positions)
        (get-position (- n 1) (cdr positions))
    )
)
(define (in-same-col? unit positions)
    (some (lambda (position) (eq? (cadr unit) (cadr position))) positions)    
)
(define (in-same-row? unit positions)
    (some (lambda (position) (eq? (car unit) (car position))) positions)    
)
(define (in-same-slope? unit positions)
    (some 
        (lambda (position) 
            (let ([x0 (car unit)] [y0 (cadr unit)] [x1 (car position)] [y1 (cadr position)] )
                    (or (= 1  (/ (- y1 y0) (- x1 x0)) ) (= -1  (/ (- y1 y0) (- x1 x0))))
            )
        )
    positions)    
)

(define (main)
    (queens 8)
)