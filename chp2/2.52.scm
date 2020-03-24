;b)
;; old corner-split

(define (corner-split painter n)
    (if (= n 0)
        painter
        (let ([up (up-split painter (- n 1))] [right (right-split painter (- n 1))])
            (let ([top-left (beside up up)] [bottom-right (below right right)] [corner (corner-split painter (- n 1))])
                (beside 
                    (below painter top-left)
                    (below corner bottom-right)
                )    
            )    
        )
    )
)

;; result

(define (corner-split painter n )
    (if (= n 0)
        painter
        (let ([up (up-split painter (- n 1))] [right (right-split painter (- n 1))] [corner (corner-split painter (- n 1))])
            (beside 
                (below painter up)
                (below corner right)
            )
        )
    )
)

;c)
;; old square-limit

(define (square-limit painter n)
    (let ([quarter (corner-split painter n)])
        (let ([half (beside (flip-horiz quarter) quarter)])
            (below (flip-vert harlf) half)
        )
    )
)

;; result

(define (square-limit painter n)
    (let ([combine (square-of-four identity flip-horiz flip-vect rotate180)])
        (combine (corner-split painter n))                          
    )
)