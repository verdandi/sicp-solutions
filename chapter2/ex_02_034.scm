(load "utilities.scm")

(define (horner-eval x coeff-seq)
    (accumulate (lambda (this-coeff higher-terms) (+ this-coeff (* higher-terms x)))
                0
                coeff-seq
    )
)
