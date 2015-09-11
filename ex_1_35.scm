(load "utilities.scm")

(define (golden-ratio x)
    (fixed-point (lambda (x) (+ 1 (/ 1 x))) x 0.000001)
)
