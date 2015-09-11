(load "utilities.scm")

;эта процедура тоже работает
;(define (iterative-improve test-guess improve)
    ;(lambda (first-guess)
            ;(define (iter guess)
                    ;(if (test-guess guess)
                        ;guess
                        ;(iter (improve guess))
                    ;)
            ;)

            ;(iter first-guess)
    ;)
;)

;ЕЩЕ КОРОЧЕ!!
(define (iterative-improve test-guess improve)
    (lambda (guess)
        (if (test-guess guess)
            guess
            ((iterative-improve test-guess improve) (improve guess))
        )
    )
)



(define (root2 x)
    (define (sqrt-test guess)
        (< (abs (- (square guess) x)) 0.00001)
    )

    (define (sqrt-improve guess)
        (average guess (/ x guess))
    )

    ((iterative-improve sqrt-test sqrt-improve) 1.0)
)

(define (common-fixed-point func first-guess tolerance)
    (define (close-enough? guess)
        (< (abs (- (func guess) guess)) tolerance)
    )

    (define (improve guess)
        (func guess)
    )

    ((iterative-improve close-enough? improve) first-guess)
)
