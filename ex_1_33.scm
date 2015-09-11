(require 'factor)

(load "utilities.scm")

(define (square-sum-for-primes-in-interval a b)
    (define (next x) (+ x 1))

    (filtered-accumulate + 0 square a next b prime?)
)

(define (mult-of-coprime-numbers n)
    (define (next x) (+ x 1))

    (define (ident x) x)

    (define (pred x)
        (if (and (< x n) (= (gcd x n) 1))
            #t
            #f
        )
    )

    (filtered-accumulate * 1 ident 1 next n pred)
)
