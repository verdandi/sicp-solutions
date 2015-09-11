(define (square x)
    (* x x)
)

(define (cube x)
    (* x x x)
)

(define (average x y)
    (/ (+ x y) 2.0)
)

(define (average-damp f)
    (lambda (x) (average x (f x)))
)

;Упражнение 1.42
(define (compose f g)
    (lambda (x) (f (g x)))
)

;Упражнение 1.43
(define (repeat f times)
    (define (iter res count)
        (if (<= count 0)
            res
            (iter (compose f f) (- count 1))
        )
    )

    (iter f times)
)

(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))
    )
)

(define (iter-sum term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ result (term a)))
        )
    )

    (iter a 0)
)

;упражение 1.31
(define (product term a next b)
    (if (> a b)
        1
        (* (term a)
           (product term (next a) next b))
    )
)

;упражение 1.31
(define (iter-product term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))
        )
    )

    (iter a 1)
)

;упражение 1.32
(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a)
                  (accumulate combiner null-value term (next a) next b)
        )
    )
)

;упражение 1.32
(define (iter-accumulate combiner null-value term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (combiner result (term a)))
        )
    )

    (iter a null-value)
)

;упражение 1.33
(define (filtered-accumulate combiner null-value term a next b pred)
    (define (iter a result)
        (if (> a b)
            result
            (if (pred a)
                (iter (next a) (combiner result (term a)))
                (iter (next a) result)
            )
        )
    )

    (iter a null-value)
)

(define (fixed-point func first-guess tolerance)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance)
    )

    (define (try guess)
        (let ((next (func guess)))
             (if (close-enough? guess next)
                 next
                 (try next)
             )
        )
    )

    (try first-guess)
)

(define (printed-fixed-point func first-guess tolerance)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance)
    )

    (define (try guess step)
        (let ((next (func guess)))
             (display step)
             (display ") guess = ")
             (display guess)
             (display "; func(guess) = ")
             (display next)
             (newline)

             (if (close-enough? guess next)
                 next
                 (try next (+ step 1))
             )
        )
    )

    (try first-guess 1)
)

(define (finite-cont-frac get-n-proc get-d-proc k)
    (define (iter res k)
        (let ((n_cur (get-n-proc k))
              (d_cur (get-d-proc k)))

             (if (<= k 0)
                 res
                 (iter (/ n_cur (+ res d_cur)) (- k 1))
             )
         )
    )

    (iter 0 k)
)

(define (deriv g dx)
    (lambda (x) (/ (- (g (+ x dx)) (g x)) dx))
)

(define (newtons-method g guess tolerance)
    (define (newton-transform g)
        (lambda (x) (- x (/ (g x) ((deriv g tolerance) x))))
    )

    (fixed-point (newton-transform g) guess tolerance)
)

