(define (entry tree)
    (car tree)
)
(define (left-branch tree)
    (cadr tree)
)
(define (right-branch tree)
    (caddr tree)
)
(define (make-tree entry left right)
    (list entry left right)
)

(define (element-of-set? x set)
    (cond
        ((null? set) #f)
        ((= x (entry set)) #t)
        ((> x (entry set)) (element-of-set? x (right-branch set)))
        ((< x (entry set)) (element-of-set? x (left-branch set)))
    )
)
(define (adjoin-set x set)
    (cond
        ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((> x (entry set)) (make-tree (entry set) (left-branch) (adjoin-set x (right-branch set))))
        ((< x (entry set)) (make-tree (entry set) (adjoin-set x (left-branch set)) (right-branch)))
    )
)

(define (tree->list-1 tree)
    (if (null? tree)
        '()
        (append
            (tree->list-1 (left-branch tree))
            (cons (entry tree)
                (tree->list-1 (right-branch tree))
            )
        )
    )
)

(define (tree->list-2 tree)
    (define (copy-to-list tree list)
        (if (null? tree)
            list
            (copy-to-list 
                (left-branch tree)
                (cons (entry tree) 
                    (copy-to-list (right-branch tree) list)
                )
            )
        )
    )
    (copy-to-list tree '())
)

(define (main)
    (define demo-tree1 
        (make-tree 7
            (make-tree 3
                (make-tree 1 '() '())
                (make-tree 5 '() '()))
            (make-tree 9
                '()
                (make-tree 11 '() '()))
        )
    )
    (define demo-tree2 
        (make-tree 3
            (make-tree 1 '() '())
            (make-tree 7
                (make-tree 5 '() '())
                (make-tree 9
                    '()
                    (make-tree 11 '() '())))
        )
    )
    (define demo-tree3 
        (make-tree 5
            (make-tree 3
                (make-tree 1 '() '())
                '())
            (make-tree 9
                (make-tree 7 '() '())
                (make-tree 11 '() '()))
        )
    )

    (display "tree->list-1")
    (display (tree->list-1 demo-tree1))
    (display (tree->list-1 demo-tree2))
    (display (tree->list-1 demo-tree3))
    (newline)
    (newline)
    (display "tree->list-2")
    (display (tree->list-2 demo-tree1))
    (display (tree->list-2 demo-tree2))
    (display (tree->list-2 demo-tree3))
)

; a) same

; b)  
; tree->list-1: Θ(n^2) = Θ(append) * Θ(n)
; tree->list-2: Θ(n) 