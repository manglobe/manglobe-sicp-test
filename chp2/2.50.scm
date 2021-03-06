(define (flip-horiz painter)
    (transform-painter painter
        (make-vert 1.0 0.0)    
        (make-vert 0.0 0.0)    
        (make-vert 1.0 1.0)    
    )
)
(define (rotate-270-re painter)
    (transform-painter painter
        (make-vert 1.0 0.0)    
        (make-vert 0.0 0.0)    
        (make-vert 1.0 1.0)    
    )
)
(define (rotate-180-re painter)
    (transform-painter painter
        (make-vert 0.0 1.0)    
        (make-vert 1.0 1.0)    
        (make-vert 0.0 0.0)    
    )
)