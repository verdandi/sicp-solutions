;код поиска простых чисел на базе алгоритма Ферма

(load "ex_1_24_p1.scm")

(define (next-odd-value x)
    (if (even? x)
        (+ x 1)
        x
    )
)

(define (search-prime start-value)
    (define result (timed-prime-test (next-odd-value start-value)))
    (if (= result 0)
        (search-prime (+ (next-odd-value start-value) 2))
        result
    )
)

(define (search-for-primes start-value number-of-primes)
    (if (> number-of-primes 0)
        (search-for-primes (+ (search-prime start-value) 1) (- number-of-primes 1))
    )
)

(define (timed-prime-test n)
    (start-prime-test n (runtime))
)

(define (start-prime-test n start-time)
    (if (fast-prime? n 100)
        (report-prime n (- (runtime) start-time))
        0
    )
)

(define (report-prime n elapsed-time)
    (display "prime - ")
    (display n)
    (newline)
    (display "elapsed time - ")
    (display (/ elapsed-time internal-time-units-per-second))
    (newline)
    n
)

(define (runtime)
    (get-internal-run-time)
)
