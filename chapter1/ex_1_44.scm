(load "utilities.scm")

(define (smooth f)
    (let ((dx 0.000001))
         (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3))
    )
)
