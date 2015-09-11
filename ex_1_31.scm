(load "utilities.scm")

(define (fact n)
    (define (ident x) x)
    (define (next x) (+ x 1))

    (if (or (= n 0) (= n 1))
        1
        (iter-product ident 1 next n)
    )
)

(define (pi-prod prec)
    (define (term k)
        (cond ((= k 1) (/ 2 3))
              ((even? k) (/ (+ k 2) (+ k 1)))
              (else (/ (+ k 1) (+ k 2)))
        )
    )

    (define (next k) (+ k 1))

    (if (<= prec 1)
        3
        (* 4 (iter-product term 1 next prec))
    )
)

