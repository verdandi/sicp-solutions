(define (square x)
    (* x x)
)

(define (expmod base ex m)
    (cond ((= ex 0) 1)
        ((even? ex)
            (remainder (square (expmod base (/ ex 2) m)) m))
        (else
            (remainder (* base (expmod base (- ex 1) m)) m))
    )
)

(define (report n)
    (display n)
    (display " failed test")
    (newline)
)


(define (fermat-test n)
    (define (try-it a)
        (cond ((>= a n) #t)
              ((= (expmod a n n) a) (try-it (+ a 1)))
              (else #f)
        )
    )

    (if (not (try-it 0))
        (report n)
    )
)
