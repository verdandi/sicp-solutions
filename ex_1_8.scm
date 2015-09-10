(define (cube-root x)
    (cube-root-iter 1.0 x)
)

(define (cube-root-iter guess x)
    (define new-guess (improve guess x))
    (if (good-enough? guess new-guess)
        new-guess
        (cube-root-iter new-guess x))
)

(define (improve guess x)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3)
)

(define (square x)
    (* x x)
)

(define (good-enough? previous-guess current-guess )
    (< (abs (- previous-guess current-guess)) 0.00000001)
)
