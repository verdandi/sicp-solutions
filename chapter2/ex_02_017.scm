(define (last-pair1 l)
    (if (null? l)
        '()
        (if (null? (cdr l))
            l
            (last-pair1 (cdr l))
        )
    )
)
