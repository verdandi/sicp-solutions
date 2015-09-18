(define (reverse1 l)
    (define (iter rl ol) ; rl - reversed list, ol - original list
        (if (null? ol)
            rl
            (iter (cons (car ol) rl) (cdr ol))
        )
    )

    (iter '() l)
)
