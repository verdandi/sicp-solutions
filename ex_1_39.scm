(load "utilities.scm")

(define (tang x k)
    (finite-cont-frac
        (lambda (i) (if (= i 1) x (- (* x x))))
        (lambda (i) (- (* i 2) 1))
        k
    )
)
