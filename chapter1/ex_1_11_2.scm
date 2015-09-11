;итеративный процесс
(define (f n)
    (define (iter s1 s2 s3 count)
        (if (= count (- n 4))
            (+ s1 s2 s3)
            (iter (+ s1 s2 s3) s1 s2 (+ count 1))
        )
    )

    (if (<= n 3)
        n
        (iter 3 2 1 0)
    )
)
