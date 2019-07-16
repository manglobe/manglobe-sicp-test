; page-33
(define (smallest-divisor n)
    (find-divisor n 2)
)
(define (find-divisor n test-divisor)
    (cond ((> (expt test-divisor 2) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))
    )
)
(define (divides? a b)
    (= (mod b a) 0)
)
(define (prime? n)
     (= n (smallest-divisor n))
)

;
(define (timed-prime-test n) 
    (start-prime-test n (current-time) )
)
(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime n 
            (time-difference (current-time) 
                start-time
            )
        )
        #f
    )
)

(define (report-prime n elapsed-time)
    (display n)
    (display elapsed-time)
    (newline)
    #t
)
; 

(define (next-odd n)
    (if (odd? n)
        (+ n 2)
        (+ n 1)
    )
)

(define (search-for-primes from to)
    (loop from to 0)
)

(define (loop from to count)
    (let ((n from))
        (if (and (< n to) (< count 3))
            (if (timed-prime-test n)
                (loop (next-odd n) to (+ count 1))
                (loop (next-odd n) to count)
            ) 
        )
    )
)

(define (main)
    (search-for-primes 1000 10000)    
    (newline)
    (search-for-primes 10000 100000)    
    (newline)
    (search-for-primes 100000 1000000)    
)