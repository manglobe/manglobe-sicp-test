(load "1.22.scm")

(define (smallest-divisor2 n)
    (find-divisor2 n 2)
)

(define (find-divisor2 n test-divisor)
    (cond 
        ((> (expt test-divisor 2) n) 
            n
        )
        ((divides? test-divisor n) 
            test-divisor
        )
        (else 
            (find-divisor2
                n 
                (next-odd test-divisor)
            )
        )
    )
)
(define (prime?2 n)
     (= n (smallest-divisor2 n))
)
(define (timed-prime-test2 n) 
    (start-prime-test2 n (current-time) )
)
(define (start-prime-test2 n start-time)
    (if (prime?2 n)
        (report-prime n 
            (time-difference (current-time) 
                start-time
            )
        )
        #f
    )
)
(define (search-for-primes2 from to)
    (loop2 from to 0)
)

(define (loop2 from to count)
    (let ((n from))
        (if (and (< n to) (< count 3))
            (if (timed-prime-test2 n)
                (loop (next-odd n) to (+ count 1))
                (loop (next-odd n) to count)
            ) 
        )
    )
)
;


(define (main)
    (search-for-primes 100  1000)    
    (search-for-primes2 100  1000)    
    (newline)
    (search-for-primes 1000 10000)    
    (search-for-primes2 1000  10000)    
    (newline)
    (search-for-primes 10000 100000)    
    (search-for-primes2 10000  100000)    
    (newline)
    (search-for-primes 100000 1000000)    
    (search-for-primes2 100000  1000000)    
)