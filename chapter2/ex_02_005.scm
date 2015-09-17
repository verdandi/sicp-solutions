(define (new-cons x y)
    (if (and (>= x 0) (>= y 0))
        (* (expt 2 x) (expt 3 y))
        (error "bad args")
    )
)

(define (new-car z)
    (define (iter number count)
        (let ((r (remainder number 2))
              (q (quotient number 2)))
            (if (not (= r 0))
                count
                (iter q (+ count 1))
            )
        )
    )

    (iter z 0)
)


(define (new-cdr z)
    (define (iter number count)
        (let ((r (remainder number 3))
              (q (quotient number 3)))
            (if (not (= r 0))
                count
                (iter q (+ count 1))
            )
        )
    )

    (iter z 0)
)
