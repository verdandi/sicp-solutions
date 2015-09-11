; другой вариант решения

(define (iterative-improve improve test-guess)
    (lambda (guess)
        (let ((next-guess (improve guess)))
            (if (test-guess next-guess guess)
                next-guess
                ((iterative-improve improve test-guess) next-guess)
            )
        )
    )
)

(define (close-enough? v1 v2)
    (let ((tolerance 0.000001))
        (< (/ (abs (- v1 v2)) v2) tolerance)
    )
)

(define (root2 x)
    ((iterative-improve
        (lambda (y)
            (/ (+ (/ x y) y) 2))
        close-enough?) 1.0)
)

(define (fixed-point f first-guess)
    ((iterative-improve
        f
        close-enough?) first-guess)
)
