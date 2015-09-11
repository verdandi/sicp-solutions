(load "utilities.scm")

(define (equation x)
    (printed-fixed-point (lambda (x) (/ (log 1000) (log x))) x 0.0000001)
)

(define (average-equation x)
    (printed-fixed-point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2)) x 0.0000001)
)
