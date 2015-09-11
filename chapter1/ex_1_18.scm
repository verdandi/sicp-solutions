(define (fast-sum a b)
    (define (double x)
        (+ x x)
    )

    (define (halve x)
        (/ x 2)
    )

    (define (iter additional cur-res cur-rem)
        (if (= cur-rem 1)
            (+ additional cur-res)
            (if (not (even? cur-rem))
                (iter (+ additional cur-res) cur-res (- cur-rem 1))
                (iter additional (double cur-res) (halve cur-rem))
            )
        )
    )

    (if (or (= a 0) (= b 0))
        0
        (iter 0 a b)
    )
)
