(load "utilities.scm")

(define (e)
    (define (get-n i) 1.0)

    (define (get-d i)
        (cond ((= i 1) 1)
              ((= i 2) 2)
              ((= (remainder (+ i 1) 3) 0) (* (/ (+ i 1) 3) 2))
              (else 1)
        )
    )

    (+ (finite-cont-frac get-n get-d 50) 2)
)
